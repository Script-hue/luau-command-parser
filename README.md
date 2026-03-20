# Luau Command Parser

A lightweight and secure system for handling administrative chat commands in Roblox.

### Features
* **Pattern Matching:** Efficient string parsing to identify commands and arguments.
* **Permission System:** Integrated check to ensure only authorized users can run commands.
* **Modular Commands:** Easily add new commands by injecting them into the command table.

### How to Use
1. Place the `CommandService` in `ServerScriptService`.
2. Add a user ID to the `ADMIN_LIST` in the script.
3. Use commands in-game: `/tp player1 player2` or `/kill player1`.

---
**Developed by Script-hue** MIT License.
