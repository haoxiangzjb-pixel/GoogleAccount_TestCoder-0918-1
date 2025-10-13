#include "MyPlayerController.h"
#include "Engine/World.h" // For GetWorld()

void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Here you would typically bind to the input mapping context and actions
    // For example:
    // if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
    // {
    //     EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &AMyPlayerController::MoveForward);
    //     ...
    // }
}

void AMyPlayerController::MoveForward(float Value)
{
    // Add movement logic here
    if (GetPawn())
    {
        GetPawn()->AddMovementInput(GetPawn()->GetActorForwardVector(), Value);
    }
}

void AMyPlayerController::MoveRight(float Value)
{
    // Add movement logic here
    if (GetPawn())
    {
        GetPawn()->AddMovementInput(GetPawn()->GetActorRightVector(), Value);
    }
}

void AMyPlayerController::LookUp(float Value)
{
    // Add look up/down logic here
    AddControllerPitchInput(Value);
}

void AMyPlayerController::Turn(float Value)
{
    // Add turn logic here
    AddControllerYawInput(Value);
}

void AMyPlayerController::Jump()
{
    // Add jump logic here
    if (GetPawn())
    {
        GetPawn()->Jump();
    }
}