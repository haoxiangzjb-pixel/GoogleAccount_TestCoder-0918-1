#include "PlayerInputHandler.h"
#include "Camera/CameraComponent.h"
#include "GameFramework/SpringArmComponent.h"
#include "Components/InputComponent.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

	// Create a spring arm component to follow the character
	SpringArm = CreateDefaultSubobject<USpringArmComponent>(TEXT("SpringArm"));
	SpringArm->SetupAttachment(RootComponent);
	SpringArm->bUsePawnControlRotation = true; // Rotate the arm based on the controller

	// Create a camera component and attach to the spring arm
	Camera = CreateDefaultSubobject<UCameraComponent>(TEXT("Camera"));
	Camera->SetupAttachment(SpringArm, USpringArmComponent::SocketName);
	Camera->bUsePawnControlRotation = false; // Camera doesn't rotate when the controller rotates
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

	// Add movement logic here if needed
}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind axis mappings
	PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
	PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
	PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the forward direction
		AddMovementInput(GetActorForwardVector(), Value);
		ForwardInput = Value;
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add movement in the right direction
		AddMovementInput(GetActorRightVector(), Value);
		RightInput = Value;
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		// Look up/down input
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Turn left/right input
		AddControllerYawInput(Value);
	}
}