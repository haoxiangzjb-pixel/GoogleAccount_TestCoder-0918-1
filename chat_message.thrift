namespace py chat
namespace java chat

struct ChatMessage {
  1: required string id,
  2: required string sender,
  3: required string content,
  4: required i64 timestamp,
  5: optional string roomId,
  6: optional bool isSystemMessage = false
}