// PlayerInputHandler_789f9a44.cpp
// A Unreal Engine class for handling player input

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "PlayerInputHandler_789f9a44.h"

// Constructor
APlayerInputHandler::APlayerInputHandler()
{
    // Set this character to call Tick() every frame. You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    Super::SetupPlayerInputComponent(PlayerInputComponent);

    // Binding movement inputs
    PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
    PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
    
    // Binding rotation inputs
    PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
    PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
    
    // Binding action inputs
    PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
    PlayerInputComponent->BindAction("Jump", IE_Released, this, &APlayerInputHandler::StopJumping);
}

// Movement functions
void APlayerInputHandler::MoveForward(float Value)
{
    if ((Controller != nullptr) && (Value != 0.0f))
    {
        // Find out which way is forward
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get forward vector
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        AddMovementInput(Direction, Value);
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if ((Controller != nullptr) && (Value != 0.0f))
    {
        // Find out which way is right
        const FRotator Rotation = Controller->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get right vector
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        AddMovementInput(Direction, Value);
    }
}

// Rotation functions
void APlayerInputHandler::Turn(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerYawInput(Rate * BaseTurnRate * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler::LookUp(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerPitchInput(Rate * BaseLookUpRate * GetWorld()->GetDeltaSeconds());
}

// Action functions
void APlayerInputHandler::Jump()
{
    ACharacter::Jump();
}

void APlayerInputHandler::StopJumping()
{
    ACharacter::StopJumping();
}