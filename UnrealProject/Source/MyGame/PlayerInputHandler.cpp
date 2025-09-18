// PlayerInputHandler.cpp
#include "PlayerInputHandler.h"
#include "GameFramework/Character.h"
#include "GameFramework/Pawn.h"
#include "Engine/World.h"

// Constructor
APlayerInputHandler::APlayerInputHandler()
{
	// Set this controller to call Tick() every frame
	PrimaryActorTick.bCanEverTick = true;
	
	// Initialize state variables
	bIsJumping = false;
	bIsFiring = false;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
}

// Called to bind functionality to input
void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind input actions to functions
	InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::HandleJump);
	InputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::HandleFire);
	
	// Bind input axes to functions
	InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::HandleMoveForward);
	InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::HandleMoveRight);
}

// Input action handlers
void APlayerInputHandler::HandleJump()
{
	if (GetPawn())
	{
		GetPawn()->Jump();
		bIsJumping = true;
	}
}

void APlayerInputHandler::HandleMoveForward(float Value)
{
	if (Value != 0.0f && GetPawn())
	{
		// Find out which way is forward
		const FRotator Rotation = GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get forward vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		GetPawn()->AddMovementInput(Direction, Value);
	}
}

void APlayerInputHandler::HandleMoveRight(float Value)
{
	if (Value != 0.0f && GetPawn())
	{
		// Find out which way is right
		const FRotator Rotation = GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get right vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
		GetPawn()->AddMovementInput(Direction, Value);
	}
}

void APlayerInputHandler::HandleFire()
{
	// Implement firing logic here
	bIsFiring = true;
	
	// For example, you might spawn a projectile or perform a raycast
	// depending on your game's mechanics
	
	// Reset the firing state after a short delay
	FTimerHandle ResetFiringTimer;
	GetWorld()->GetTimerManager().SetTimer(ResetFiringTimer, [this]() {
		bIsFiring = false;
	}, 0.1f, false);
}