// Copyright Epic Games, Inc. All Rights Reserved.

#include "MyPlayerController.h"
#include "Engine/World.h"


void AMyPlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind input axis
	if (InputComponent)
	{
		InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);

		// Bind input action
		InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
		InputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController::StopJumping);
	}
}

void AMyPlayerController::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void AMyPlayerController::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void AMyPlayerController::Jump()
{
	// Handle jump start
	bPressedJump = true;
}

void AMyPlayerController::StopJumping()
{
	// Handle jump stop
	bPressedJump = false;
}