# 表示該 dockerfile 建立的鏡像是基於 node
FROM node

# 建立環境變數 webPATH
ENV webPATH /home/project5_CourseSystem
# 指定 WORKDIR 後，容器就會跳到這個路徑
WORKDIR $webPATH

# 將主機當前資料夾下的資料傳入容器中
COPY . .

# 該鏡像建立期間，會執行的指令(目前在 webPATH 下)
# 安裝網頁所需的模組
RUN npm install

# 說明該鏡像將提供哪個 port 給主機連線
# 這與自己網頁 listen 的 port 有關，例如我的網頁啟動檔案(app.js)中，監聽的 port 為 3000
EXPOSE 3000

# 說明未來容器運行時，會直接執行的指令
CMD ["node", "app.js"]