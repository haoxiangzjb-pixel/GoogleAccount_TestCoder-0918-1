#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "InputMappingContext.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();

	// Add input mapping context
	if (APlayerController* PlayerController = Cast<APlayerController>(GetController()))
	{
		if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PlayerController->GetLocalPlayer()))
		{
			Subsystem->AddMappingContext(DefaultMappingContext, 0);
		}
	}
}

void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Set up input actions
	if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
	{
		// Movement
		EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
		EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);

		// Look
		EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUp);
		EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Turn);

		// Actions
		EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::Jump);
		EnhancedInputComponent->BindAction(ShootAction, ETriggerEvent::Started, this, &APlayerInputHandler::Shoot);
	}
}

void APlayerInputHandler::MoveForward(float Value)
{
	// Add movement in the forward direction
	AddMovementInput(GetActorForwardVector(), Value);
}

void APlayerInputHandler::MoveRight(float Value)
{
	// Add movement in the right direction
	AddMovementInput(GetActorRightVector(), Value);
}

void APlayerInputHandler::LookUp(float Value)
{
	// Add look up/down input
	AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
	// Add turn input
	AddControllerYawInput(Value);
}

void APlayerInputHandler::Jump()
{
	// Handle jump action
	// Example: if (Character) { Character->Jump(); }
}

void APlayerInputHandler::Shoot()
{
	// Handle shoot action
	// Example: if (Weapon) { Weapon->Fire(); }
}