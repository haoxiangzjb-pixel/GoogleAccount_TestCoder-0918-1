#include "MyPlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/Pawn.h"
#include "Components/InputComponent.h"

AMyPlayerController::AMyPlayerController()
{
	// Enable ticking
	PrimaryActorTick.bCanEverTick = true;
}

void AMyPlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Ensure InputComponent is valid
	if (InputComponent)
	{
		// Bind axis mappings
		InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
		InputComponent->BindAxis("LookUp", this, &AMyPlayerController::LookUp);
		InputComponent->BindAxis("Turn", this, &AMyPlayerController::Turn);

		// Bind action mappings
		InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
	}
}

void AMyPlayerController::MoveForward(float Value)
{
	// Get the controlled pawn
	APawn* ControlledPawn = GetPawn();
	if (ControlledPawn)
	{
		// Calculate forward direction
		const FRotator Rotation = GetControlRotation();
		const FVector Direction = FRotationMatrix(Rotation).GetUnitAxis(EAxis::X);
		// Add movement input
		ControlledPawn->AddMovementInput(Direction, Value);
	}
}

void AMyPlayerController::MoveRight(float Value)
{
	// Get the controlled pawn
	APawn* ControlledPawn = GetPawn();
	if (ControlledPawn)
	{
		// Calculate right direction
		const FRotator Rotation = GetControlRotation();
		const FVector Direction = FRotationMatrix(Rotation).GetUnitAxis(EAxis::Y);
		// Add movement input
		ControlledPawn->AddMovementInput(Direction, Value);
	}
}

void AMyPlayerController::LookUp(float Value)
{
	// Add pitch input to the controller
	AddPitchInput(Value);
}

void AMyPlayerController::Turn(float Value)
{
	// Add yaw input to the controller
	AddYawInput(Value);
}

void AMyPlayerController::Jump()
{
	// Get the controlled character
	ACharacter* ControlledCharacter = Cast<ACharacter>(GetPawn());
	if (ControlledCharacter)
	{
		// Call the character's jump function
		ControlledCharacter->Jump();
	}
}