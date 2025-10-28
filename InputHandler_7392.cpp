#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

APlayerInputHandler::APlayerInputHandler()
{
    // Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();

    // Add Input Mapping Context
    if (APlayerController* PlayerController = Cast<APlayerController>(Controller))
    {
        if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PlayerController->GetLocalPlayer()))
        {
            Subsystem->AddMappingContext(DefaultMappingContext, 0);
        }
    }
}

void APlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Set up action bindings
    if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
    {
        // Jumping
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::Jump);

        // Moving
        EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
        EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);

        // Looking
        EnhancedInputComponent->BindAction(TurnAtRate, ETriggerEvent::Triggered, this, &APlayerInputHandler::TurnAtRate);
        EnhancedInputComponent->BindAction(LookUpAtRate, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUpAtRate);

        // Fire
        EnhancedInputComponent->BindAction(FireAction, ETriggerEvent::Started, this, &APlayerInputHandler::Fire);
    }
}

void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

void APlayerInputHandler::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        // Add movement in the forward direction
        AddMovementInput(GetActorForwardVector(), Value);
        CurrentForwardValue = Value;
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        // Add movement in the right direction
        AddMovementInput(GetActorRightVector(), Value);
        CurrentRightValue = Value;
    }
}

void APlayerInputHandler::TurnAtRate(float Rate)
{
    // Calculate the turn rate (in radians per second) based on the input
    AddControllerYawInput(Rate * 50.0f * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler::LookUpAtRate(float Rate)
{
    // Calculate the pitch rate (in radians per second) based on the input
    AddControllerPitchInput(Rate * 50.0f * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler::Jump()
{
    // Handle jump input
    ACharacter* Character = Cast<ACharacter>(GetPawn());
    if (Character)
    {
        Character->Jump();
    }
}

void APlayerInputHandler::Fire()
{
    // Handle fire input
    // Add your fire logic here
}