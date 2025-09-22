// PlayerInputHandler_1GWVpcpE.cpp
// A class to handle player input in Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/CharacterMovementComponent.h"

// Player input handler class
class PlayerInputHandler
{
public:
    // Constructor
    PlayerInputHandler(APlayerController* InPlayerController)
        : PlayerController(InPlayerController)
    {
    }

    // Handle movement input
    void HandleMovementInput(float ForwardAxis, float RightAxis)
    {
        if (PlayerController)
        {
            APawn* Pawn = PlayerController->GetPawn();
            if (Pawn)
            {
                // Get the pawn's rotation
                FRotator Rotation = Pawn->GetActorRotation();
                FRotator YawRotation(0, Rotation.Yaw, 0);

                // Calculate forward and right vectors
                FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
                FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);

                // Add movement input
                Pawn->AddMovementInput(ForwardDirection, ForwardAxis);
                Pawn->AddMovementInput(RightDirection, RightAxis);
            }
        }
    }

    // Handle look input
    void HandleLookInput(float LookUpAxis, float TurnAxis)
    {
        if (PlayerController)
        {
            // Add look input
            PlayerController->AddPitchInput(LookUpAxis);
            PlayerController->AddYawInput(TurnAxis);
        }
    }

    // Handle jump input
    void HandleJumpInput(bool bIsJumping)
    {
        if (PlayerController)
        {
            APawn* Pawn = PlayerController->GetPawn();
            if (Pawn)
            {
                ACharacter* Character = Cast<ACharacter>(Pawn);
                if (Character)
                {
                    if (bIsJumping)
                    {
                        Character->Jump();
                    }
                    else
                    {
                        Character->StopJumping();
                    }
                }
            }
        }
    }

private:
    // Reference to the player controller
    TWeakObjectPtr<APlayerController> PlayerController;
};

// Example usage in a PlayerController class
/*
void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    InputHandler = MakeShareable(new PlayerInputHandler(this));

    // Bind actions
    InputComponent->BindAxis("MoveForward", this, &AMyPlayerController::MoveForward);
    InputComponent->BindAxis("MoveRight", this, &AMyPlayerController::MoveRight);
    InputComponent->BindAxis("LookUp", this, &AMyPlayerController::LookUp);
    InputComponent->BindAxis("Turn", this, &AMyPlayerController::Turn);
    InputComponent->BindAction("Jump", IE_Pressed, this, &AMyPlayerController::JumpPressed);
    InputComponent->BindAction("Jump", IE_Released, this, &AMyPlayerController::JumpReleased);
}

void AMyPlayerController::MoveForward(float Value)
{
    if (InputHandler.IsValid())
    {
        InputHandler->HandleMovementInput(Value, 0.0f);
    }
}

void AMyPlayerController::MoveRight(float Value)
{
    if (InputHandler.IsValid())
    {
        InputHandler->HandleMovementInput(0.0f, Value);
    }
}

void AMyPlayerController::LookUp(float Value)
{
    if (InputHandler.IsValid())
    {
        InputHandler->HandleLookInput(Value, 0.0f);
    }
}

void AMyPlayerController::Turn(float Value)
{
    if (InputHandler.IsValid())
    {
        InputHandler->HandleLookInput(0.0f, Value);
    }
}

void AMyPlayerController::JumpPressed()
{
    if (InputHandler.IsValid())
    {
        InputHandler->HandleJumpInput(true);
    }
}

void AMyPlayerController::JumpReleased()
{
    if (InputHandler.IsValid())
    {
        InputHandler->HandleJumpInput(false);
    }
}
*/