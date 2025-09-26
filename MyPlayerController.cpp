// Fill out your copyright notice in the Description page of Project Settings.

#include "MyPlayerController.h"

// Sets default values
AMyPlayerController::AMyPlayerController()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void AMyPlayerController::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AMyPlayerController::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void AMyPlayerController::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind movement events
	if (UInputComponent* IC = Cast<UInputComponent>(PlayerInputComponent))
	{
		IC->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
		IC->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
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