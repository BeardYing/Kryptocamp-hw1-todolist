
# KryptoCamp hw1

### Week1 - solidity版本Todo:


Solidity TodoList 加強，有分基本題、進階題，進階題可做可不做，但必須做完基本題再繳交作業

### **基本題**

-   TodoList 增加 Pending 功能，提示：string[] public pending;

### **進階題**

-   撰寫此功能測試
-   增加清空 Completed 功能
-   增加 Pending 最多滯留 n 秒
    -   Array
    -   Mapping
    -   Struct

1. 將寫好的合約部署到 Görli / Goerli 測試鏈上

2. 必須 verify 開源程式碼  

**繳交作業**  
提醒，作業標題：請填寫你的學號 （Discord KryptoCamp 的名稱），例：Hazel | C0031601

**請複製以下格式，繳交作業**

合約地址：請提供部署至 Goerli 合約地址

完成進階題

-   撰寫此功能測試：Y/N
-   增加清空 Completed 功能：Y/N
-   增加 Pending 最多滯留 n 秒：Y/n

---
### **作業回報**
合約地址：https://goerli.etherscan.io/address/0x21800e58de729d2dbd0bffeceba763d598dc357f

完成進階題

-   撰寫此功能測試：Y 
  - tests/TodoList_test.sol
-   增加清空 Completed 功能：Y 
  - func: clearCompleted()
-   增加 Pending 最多滯留 n 秒：Y 
  - func: toPending()     /     backToTodos()
  - 預設Pending 滯留時間5s , 可使用 updatePendingExpiredTime 調整 Pending時間