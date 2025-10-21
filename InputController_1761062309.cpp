#include "PlayerInputHandler.h"
#include "Components/InputComponent.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "Camera/CameraComponent.h"

// Constructor with initializer
APlayerInputHandler::APlayerInputHandler(const FObjectInitializer& ObjectInitializer) 
	: Super(ObjectInitializer.SetDefaultSubobjectClass<UCameraComponent>(TEXT("CameraComponent")))
{
	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

	// Configure character movement
	GetCharacterMovement()->bOrientRotationToMovement = true;
	GetCharacterMovement()->RotationRate = FRotator(0.0f, 640.0f, 0.0f);
	GetCharacterMovement()->bConstrainToPlane = true;
	GetCharacterMovement()->bSnapToPlaneAtStart = true;

	// Initialize input values
	ForwardInputValue = 0.0f;
	RightInputValue = 0.0f;
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

	// Bind movement actions
	PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
	
	// Bind look actions
	PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
	PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorForwardVector(), Value);
		ForwardInputValue = Value;
	}
	else
	{
		ForwardInputValue = 0.0f;
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorRightVector(), Value);
		RightInputValue = Value;
	}
	else
	{
		RightInputValue = 0.0f;
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
	AddControllerYawInput(Value);
}