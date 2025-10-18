#include "PlayerInputHandler.h"
#include "GameFramework/SpringArmComponent.h"
#include "Camera/CameraComponent.h"
#include "Components/InputComponent.h"
#include "GameFramework/CharacterMovementComponent.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

	// Get references to movement and input components
	MovementComp = GetCharacterMovement();
	InputComp = nullptr;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
}

// Setup player input component
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Movement bindings
	PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);

	// Look bindings
	PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
	PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

	// Action bindings
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::JumpAction);
	PlayerInputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::FireAction);
}

// Move forward/backward
void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

// Move right/left
void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorRightVector(), Value);
	}
}

// Look up/down
void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		AddControllerPitchInput(Value);
	}
}

// Turn left/right
void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		AddControllerYawInput(Value);
	}
}

// Handle jump action
void APlayerInputHandler::JumpAction()
{
	Jump();
}

// Handle fire action
void APlayerInputHandler::FireAction()
{
	// Add firing logic here
	// For example, spawn a projectile or trigger an animation
}