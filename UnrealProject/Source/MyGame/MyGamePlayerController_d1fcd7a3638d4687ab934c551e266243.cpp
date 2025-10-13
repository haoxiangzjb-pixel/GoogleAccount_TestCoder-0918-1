#include "MyGamePlayerController.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

AMyGamePlayerController::AMyGamePlayerController()
{
	// Enable ticking for this controller.
	PrimaryActorTick.bCanEverTick = true;
}

void AMyGamePlayerController::SetupInputComponent()
{
	// Call the base class implementation.
	Super::SetupInputComponent();

	// Get the Enhanced Input Component.
	if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
	{
		// Bind actions here if you have UInputAction assets defined.
		// Example:
		// EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &AMyGamePlayerController::MoveForward);
		// EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &AMyGamePlayerController::MoveRight);
		// EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &AMyGamePlayerController::LookUp);
		// EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &AMyGamePlayerController::Turn);
		// EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &AMyGamePlayerController::Jump);
	}
}

void AMyGamePlayerController::Tick(float DeltaTime)
{
	// Custom tick logic can go here.
	Super::Tick(DeltaTime);
}

void AMyGamePlayerController::MoveForward(float Value)
{
	// Add movement logic here.
	// Example: APawn* ControlledPawn = GetPawn(); if (ControlledPawn) { ControlledPawn->AddMovementInput(GetPawn()->GetActorForwardVector(), Value); }
}

void AMyGamePlayerController::MoveRight(float Value)
{
	// Add movement logic here.
	// Example: APawn* ControlledPawn = GetPawn(); if (ControlledPawn) { ControlledPawn->AddMovementInput(GetPawn()->GetActorRightVector(), Value); }
}

void AMyGamePlayerController::LookUp(float Value)
{
	// Add camera look-up logic here.
	// Example: APawn* ControlledPawn = GetPawn(); if (ControlledPawn) { ControlledPawn->AddControllerPitchInput(Value); }
}

void AMyGamePlayerController::Turn(float Value)
{
	// Add camera turn logic here.
	// Example: APawn* ControlledPawn = GetPawn(); if (ControlledPawn) { ControlledPawn->AddControllerYawInput(Value); }
}

void AMyGamePlayerController::Jump()
{
	// Add jump logic here.
	// Example: APawn* ControlledPawn = GetPawn(); if (ACharacter* Character = Cast<ACharacter>(ControlledPawn)) { Character->Jump(); }
}