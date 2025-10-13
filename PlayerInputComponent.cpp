// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputComponent.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "Camera/CameraComponent.h"
#include "GameFramework/Character.h"
#include "GameFramework/Controller.h"

// Sets default values for this component's properties
UPlayerInputComponent::UPlayerInputComponent()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.  You can turn these features
	// off to improve performance if you don't need them.
	PrimaryComponentTick.bCanEverTick = true;

	// ...
}


// Called when the game starts
void UPlayerInputComponent::BeginPlay()
{
	Super::BeginPlay();

	// ...
	
}


// Called every frame
void UPlayerInputComponent::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// ...
}

void UPlayerInputComponent::SetupInputComponent(ACharacter* PlayerCharacter)
{
	if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(PlayerCharacter->InputComponent))
	{
		// Add input mapping context
		if (APlayerController* PlayerController = Cast<APlayerController>(PlayerCharacter->GetController()))
		{
			if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PlayerController->GetLocalPlayer()))
			{
				Subsystem->AddMappingContext(InputMappingContext, 0);
			}
		}

		// Bind actions
		EnhancedInputComponent->BindAction(MoveAction, ETriggerEvent::Triggered, this, &UPlayerInputComponent::Move, PlayerCharacter);
		EnhancedInputComponent->BindAction(LookAction, ETriggerEvent::Triggered, this, &UPlayerInputComponent::Look, PlayerCharacter);
		EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &UPlayerInputComponent::Jump, PlayerCharacter);
		EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Completed, this, &UPlayerInputComponent::StopJump, PlayerCharacter);
	}
}

void UPlayerInputComponent::Move(ACharacter* PlayerCharacter, const FInputActionValue& Value)
{
	FVector2D MovementVector = Value.Get<FVector2D>();

	if (PlayerCharacter)
	{
		PlayerCharacter->AddMovementInput(FRotationMatrix(PlayerCharacter->GetActorRotation()).GetUnitAxis(EAxis::X), MovementVector.X);
		PlayerCharacter->AddMovementInput(FRotationMatrix(PlayerCharacter->GetActorRotation()).GetUnitAxis(EAxis::Y), MovementVector.Y);
	}
}

void UPlayerInputComponent::Look(ACharacter* PlayerCharacter, const FInputActionValue& Value)
{
	FVector2D LookAxisVector = Value.Get<FVector2D>();

	if (PlayerCharacter)
	{
		PlayerCharacter->AddControllerYawInput(LookAxisVector.X);
		PlayerCharacter->AddControllerPitchInput(LookAxisVector.Y);
	}
}

void UPlayerInputComponent::Jump(ACharacter* PlayerCharacter, const FInputActionValue& Value)
{
	if (PlayerCharacter)
	{
		PlayerCharacter->Jump();
	}
}

void UPlayerInputComponent::StopJump(ACharacter* PlayerCharacter, const FInputActionValue& Value)
{
	if (PlayerCharacter)
	{
		PlayerCharacter->StopJumping();
	}
}
