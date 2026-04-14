// PlayerInputHandler.cpp
// Unreal Engine C++ class for handling player input

#include "PlayerInputHandler.h"
#include "GameFramework/PlayerController.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "Engine/LocalPlayer.h"
#include "Kismet/GameplayStatics.h"
#include "Serialization/Archive.h"
#include "HAL/FileManager.h"

UPlayerInputHandler::UPlayerInputHandler()
{
    PrimaryComponentTick.bCanEverTick = true;
}

void UPlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();

    // Get the Enhanced Input Local Player Subsystem
    if (APlayerController* PlayerController = Cast<APlayerController>(GetOwner()))
    {
        if (ULocalPlayer* LocalPlayer = PlayerController->GetLocalPlayer())
        {
            UEnhancedInputLocalPlayerSubsystem* InputSubsystem = 
                LocalPlayer->GetSubsystem<UEnhancedInputLocalPlayerSubsystem>();
            
            if (InputSubsystem && DefaultMappingContext)
            {
                FModifyContextOptions Options = {};
                Options.bIgnoreAllPhantomActions = true;
                InputSubsystem->AddMappingContext(DefaultMappingContext, Options);
            }
        }
    }
}

void UPlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent);
    if (!EnhancedInputComponent)
    {
        return;
    }

    // Bind movement actions
    if (MoveAction)
    {
        EnhancedInputComponent->BindAction(MoveAction, ETriggerEvent::Triggered, this, &UPlayerInputHandler::HandleMoveInput);
    }

    if (LookAction)
    {
        EnhancedInputComponent->BindAction(LookAction, ETriggerEvent::Triggered, this, &UPlayerInputHandler::HandleLookInput);
    }

    if (JumpAction)
    {
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &UPlayerInputHandler::HandleJumpInput);
    }

    if (SprintAction)
    {
        EnhancedInputComponent->BindAction(SprintAction, ETriggerEvent::Started, this, &UPlayerInputHandler::HandleSprintStart);
        EnhancedInputComponent->BindAction(SprintAction, ETriggerEvent::Completed, this, &UPlayerInputHandler::HandleSprintEnd);
    }
}

void UPlayerInputHandler::HandleMoveInput(const FInputActionValue& Value)
{
    FVector2D MovementVector = Value.Get<FVector2D>();
    
    CurrentMovementInput.X = MovementVector.Y;
    CurrentMovementInput.Y = MovementVector.X;

    // Save input state periodically or on significant changes
    SaveInputState();
}

void UPlayerInputHandler::HandleLookInput(const FInputActionValue& Value)
{
    FVector2D LookAxisVector = Value.Get<FVector2D>();

    CurrentLookInput.X = LookAxisVector.Y;
    CurrentLookInput.Y = LookAxisVector.X;

    SaveInputState();
}

void UPlayerInputHandler::HandleJumpInput(const FInputActionValue& Value)
{
    bWantsToJump = true;
    LastJumpTimestamp = GetWorld()->GetTimeSeconds();
    
    SaveInputState();
}

void UPlayerInputHandler::HandleSprintStart(const FInputActionValue& Value)
{
    bIsSprinting = true;
    SaveInputState();
}

void UPlayerInputHandler::HandleSprintEnd(const FInputActionValue& Value)
{
    bIsSprinting = false;
    SaveInputState();
}

void UPlayerInputHandler::SaveInputState()
{
    // Serialize current input state to JSON or binary format
    FString InputData = SerializeInputState();
    
    // Generate a unique filename with timestamp
    FString Timestamp = FString::Printf(TEXT("%lld"), FPlatformTime::Cycles64());
    FString FileName = FString::Printf(TEXT("InputSave_%s.dat"), *Timestamp);
    
    // Get the game directory for saving
    FString SaveDirectory = FPaths::ProjectSavedDir() / TEXT("InputStates");
    
    // Ensure directory exists
    IFileManager::Get().MakeDirectory(*SaveDirectory, true);
    
    FString FullPath = SaveDirectory / FileName;
    
    // Write to file
    FFileHelper::SaveStringToFile(InputData, *FullPath);
    
    UE_LOG(LogTemp, Log, TEXT("Input state saved to: %s"), *FullPath);
}

FString UPlayerInputHandler::SerializeInputState()
{
    // Simple serialization format - can be extended to JSON or custom binary
    FString SerializedData;
    SerializedData += FString::Printf(TEXT("MovementX:%f,"), CurrentMovementInput.X);
    SerializedData += FString::Printf(TEXT("MovementY:%f,"), CurrentMovementInput.Y);
    SerializedData += FString::Printf(TEXT("LookX:%f,"), CurrentLookInput.X);
    SerializedData += FString::Printf(TEXT("LookY:%f,"), CurrentLookInput.Y);
    SerializedData += FString::Printf(TEXT("Jump:%d,"), bWantsToJump ? 1 : 0);
    SerializedData += FString::Printf(TEXT("Sprint:%d,"), bIsSprinting ? 1 : 0);
    SerializedData += FString::Printf(TEXT("Timestamp:%f"), GetWorld()->GetTimeSeconds());
    
    return SerializedData;
}

bool UPlayerInputHandler::LoadInputState(const FString& FileName)
{
    FString LoadDirectory = FPaths::ProjectSavedDir() / TEXT("InputStates");
    FString FullPath = LoadDirectory / FileName;
    
    FString LoadedData;
    if (FFileHelper::LoadFileToString(LoadedData, *FullPath))
    {
        // Parse the loaded data
        TArray<FString> Pairs;
        LoadedData.ParseIntoArray(Pairs, TEXT(","));
        
        for (const FString& Pair : Pairs)
        {
            TArray<FString> KeyValue;
            Pair.ParseIntoArray(KeyValue, TEXT(":"));
            
            if (KeyValue.Num() == 2)
            {
                FString Key = KeyValue[0];
                float Value = FCString::Atof(*KeyValue[1]);
                
                if (Key == TEXT("MovementX")) CurrentMovementInput.X = Value;
                else if (Key == TEXT("MovementY")) CurrentMovementInput.Y = Value;
                else if (Key == TEXT("LookX")) CurrentLookInput.X = Value;
                else if (Key == TEXT("LookY")) CurrentLookInput.Y = Value;
                else if (Key == TEXT("Jump")) bWantsToJump = (Value > 0);
                else if (Key == TEXT("Sprint")) bIsSprinting = (Value > 0);
            }
        }
        
        UE_LOG(LogTemp, Log, TEXT("Input state loaded from: %s"), *FullPath);
        return true;
    }
    
    UE_LOG(LogTemp, Warning, TEXT("Failed to load input state from: %s"), *FullPath);
    return false;
}

void UPlayerInputHandler::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
    Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

    // Reset jump flag after processing
    if (bWantsToJump)
    {
        bWantsToJump = false;
    }
}

void UPlayerInputHandler::ClearSavedInputs()
{
    FString SaveDirectory = FPaths::ProjectSavedDir() / TEXT("InputStates");
    
    // Delete all files in the input states directory
    IFileManager::Get().DeleteFilesByWildcard(*(SaveDirectory / TEXT("*.dat")));
    
    UE_LOG(LogTemp, Log, TEXT("All saved input states cleared"));
}
