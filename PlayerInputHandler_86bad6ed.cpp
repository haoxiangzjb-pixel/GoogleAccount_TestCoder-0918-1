#include "MyPlayerInputClass.h"
#include "GameFramework/Character.h"
#include "GameFramework/PlayerController.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputActionValue.h"

void AMyPlayerInputClass::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    Super::SetupPlayerInputComponent(PlayerInputComponent);

    // Cast the Input Component to the Enhanced Input Component
    UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(PlayerInputComponent);
    if (EnhancedInputComponent)
    {
        // Bind the actions
        EnhancedInputComponent->BindAction(MoveAction, ETriggerEvent::Triggered, this, &AMyPlayerInputClass::Move);
        EnhancedInputComponent->BindAction(LookAction, ETriggerEvent::Triggered, this, &AMyPlayerInputClass::Look);
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &ACharacter::Jump);
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Completed, this, &ACharacter::StopJumping);
    }
}

void AMyPlayerInputClass::Move(const FInputActionValue& Value)
{
    FVector2D InputVector = Value.Get<FVector2D>();
    
    if (Controller)
    {
        AddMovementInput(FVector(InputVector.X, 0.0f, 0.0f));
        AddMovementInput(FVector(0.0f, InputVector.Y, 0.0f));
    }
}

void AMyPlayerInputClass::Look(const FInputActionValue& Value)
{
    FVector2D InputVector = Value.Get<FVector2D>();

    if (Controller)
    {
        AddControllerYawInput(InputVector.X);
        AddControllerPitchInput(InputVector.Y);
    }
}

void AMyPlayerInputClass::BeginPlay()
{
    Super::BeginPlay();

    // Get the local player subsystem
    UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer());
    
    // Add the mapping context so the input actions are registered
    if (Subsystem)
    {
        Subsystem->AddMappingContext(DefaultMappingContext, 0);
    }
}