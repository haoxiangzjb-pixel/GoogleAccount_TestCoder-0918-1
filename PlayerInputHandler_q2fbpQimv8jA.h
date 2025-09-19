// PlayerInputHandler_q2fbpQimv8jA.h
// Header file for the player input handling class in Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "PlayerInputHandler_q2fbpQimv8jA.generated.h"

UCLASS(ClassGroup=(Custom), meta=(BlueprintSpawnableComponent))
class UPlayerInputHandler : public UActorComponent
{
	GENERATED_BODY()

public:
	// Sets default values for this component's properties
	UPlayerInputHandler();

protected:
	// Called when the game starts
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;

	// Input axis bindings
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input Settings")
	FString MoveForwardAxis;
	
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input Settings")
	FString MoveRightAxis;

	// Input action bindings
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Input Settings")
	FString JumpAction;

private:
	// Bind input actions to functions
	void BindInputActions();

	// Movement functions
	UFUNCTION()
	void MoveForward(float Value);
	
	UFUNCTION()
	void MoveRight(float Value);

	// Jump functions
	UFUNCTION()
	void Jump();
	
	UFUNCTION()
	void StopJumping();
};