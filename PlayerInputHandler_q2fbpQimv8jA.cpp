// PlayerInputHandler_q2fbpQimv8jA.cpp
// Implementation of the player input handling class for Unreal Engine

#include "PlayerInputHandler_q2fbpQimv8jA.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/PlayerController.h"
#include "Engine/World.h"

// Sets default values for this component's properties
UPlayerInputHandler::UPlayerInputHandler()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.
	PrimaryComponentTick.bCanEverTick = true;
	
	// Initialize input bindings
	MoveForwardAxis = "MoveForward";
	MoveRightAxis = "MoveRight";
	JumpAction = "Jump";
}

// Called when the game starts
void UPlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
	// Bind input actions
	BindInputActions();
}

// Called every frame
void UPlayerInputHandler::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// Handle continuous input here if needed
}

// Bind input actions to their respective functions
void UPlayerInputHandler::BindInputActions()
{
	if (APlayerController* PlayerController = GetOwningPlayer())
	{
		// Bind axis inputs
		PlayerController->InputComponent->BindAxis(MoveForwardAxis, this, &UPlayerInputHandler::MoveForward);
		PlayerController->InputComponent->BindAxis(MoveRightAxis, this, &UPlayerInputHandler::MoveRight);
		
		// Bind action inputs
		PlayerController->InputComponent->BindAction(JumpAction, IE_Pressed, this, &UPlayerInputHandler::Jump);
		PlayerController->InputComponent->BindAction(JumpAction, IE_Released, this, &UPlayerInputHandler::StopJumping);
	}
}

// Move forward/backward based on input value
void UPlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Get the owning pawn to move
		if (APawn* Pawn = GetOwner<APawn>())
		{
			// Find forward direction
			FVector Direction = Pawn->GetActorForwardVector();
			
			// Add movement in that direction
			Pawn->AddMovementInput(Direction, Value);
		}
	}
}

// Move right/left based on input value
void UPlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Get the owning pawn to move
		if (APawn* Pawn = GetOwner<APawn>())
		{
			// Find right direction
			FVector Direction = Pawn->GetActorRightVector();
			
			// Add movement in that direction
			Pawn->AddMovementInput(Direction, Value);
		}
	}
}

// Jump action
void UPlayerInputHandler::Jump()
{
	if (APawn* Pawn = GetOwner<APawn>())
	{
		Pawn->Jump();
	}
}

// Stop jumping action
void UPlayerInputHandler::StopJumping()
{
	if (APawn* Pawn = GetOwner<APawn>())
	{
		Pawn->StopJumping();
	}
}