// oBrTcGKgfw.cpp
// Player input handler class implementation for Unreal Engine

#include "oBrTcGkGfw.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "Engine/World.h"

// Constructor
APlayerInputHandler::APlayerInputHandler()
{
    // Set this controller to call Tick() every frame
    PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();

    // Add Enhanced Input mapping context
    if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
    {
        Subsystem->AddMappingContext(DefaultMappingContext, 0);
    }
}

// Called to bind functionality to input
void APlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Cast to EnhancedInputComponent
    if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
    {
        // Bind actions
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::OnJumpActionStarted);
        EnhancedInputComponent->BindAction(MoveAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::OnMoveAction);
        EnhancedInputComponent->BindAction(LookAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::OnLookAction);
    }
}

// Input callback functions
void APlayerInputHandler::OnJumpActionStarted(const FInputActionValue& Value)
{
    // Handle jump action
    if (APawn* ControlledPawn = GetPawn())
    {
        ControlledPawn->Jump();
    }
}

void APlayerInputHandler::OnMoveAction(const FInputActionValue& Value)
{
    // Handle movement action
    if (APawn* ControlledPawn = GetPawn())
    {
        const FVector2D MovementVector = Value.Get<FVector2D>();
        
        // Get forward and right directions
        const FRotator Rotation = ControlledPawn->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);
        
        const FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        const FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        
        // Apply movement
        ControlledPawn->AddMovementInput(ForwardDirection, MovementVector.Y);
        ControlledPawn->AddMovementInput(RightDirection, MovementVector.X);
    }
}

void APlayerInputHandler::OnLookAction(const FInputActionValue& Value)
{
    // Handle look action
    const FVector2D LookAxisVector = Value.Get<FVector2D>();
    
    if (APawn* ControlledPawn = GetPawn())
    {
        // Add yaw and pitch input
        ControlledPawn->AddControllerYawInput(LookAxisVector.X);
        ControlledPawn->AddControllerPitchInput(LookAxisVector.Y);
    }
}