#include "PlayerInputComponent.h"

// Sets default values for this component's properties
UPlayerInputComponent::UPlayerInputComponent()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.  You can turn these features
	// off to improve performance if you don't need them.
	PrimaryComponentTick.bCanEverTick = true;

	// ...
}


// Called when the game starts
void UPlayerInputComponent::BeginPlay()
{
	Super::BeginPlay();

	// ...
	
}


// Called every frame
void UPlayerInputComponent::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// ...
}

void UPlayerInputComponent::MoveForward(float Value)
{
	// Add forward movement logic here
	if (Value != 0.0f)
	{
		// Example: Add movement input to the owning actor
		// APawn* OwnerPawn = Cast<APawn>(GetOwner());
		// if (OwnerPawn)
		// {
		//     OwnerPawn->AddMovementInput(OwnerPawn->GetActorForwardVector(), Value);
		// }
	}
}

void UPlayerInputComponent::Turn(float Value)
{
	// Add turning logic here
	if (Value != 0.0f)
	{
		// Example: Add controller input to the owning actor
		// APlayerController* PlayerController = Cast<APlayerController>(GetOwner()->GetController());
		// if (PlayerController)
		// {
		//     PlayerController->AddYawInput(Value);
		// }
	}
}

void UPlayerInputComponent::MoveRight(float Value)
{
	// Add right movement logic here
	if (Value != 0.0f)
	{
		// Example: Add movement input to the owning actor
		// APawn* OwnerPawn = Cast<APawn>(GetOwner());
		// if (OwnerPawn)
		// {
		//     OwnerPawn->AddMovementInput(OwnerPawn->GetActorRightVector(), Value);
		// }
	}
}

void UPlayerInputComponent::LookUp(float Value)
{
	// Add look up/down logic here
	if (Value != 0.0f)
	{
		// Example: Add controller input to the owning actor
		// APlayerController* PlayerController = Cast<APlayerController>(GetOwner()->GetController());
		// if (PlayerController)
		// {
		//     PlayerController->AddPitchInput(Value);
		// }
	}
}