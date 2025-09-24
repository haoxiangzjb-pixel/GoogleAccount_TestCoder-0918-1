// Fill out your copyright notice in the Description page of Project Settings.

#include "MyPlayerController.h"

void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    if (InputComponent)
    {
        InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::Jump);
        InputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController::StopJumping);

        InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
        InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
    }
}

void AMyPlayerController::Jump()
{
    // Handle jump input
}

void AMyPlayerController::StopJumping()
{
    // Handle stop jumping input
}

void AMyPlayerController::MoveForward(float Value)
{
    // Handle forward movement input
}

void AMyPlayerController::MoveRight(float Value)
{
    // Handle right movement input
}