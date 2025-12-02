@echo off
REM ==========================
REM SmartBook-RAG Windows 启动脚本
REM 后端 FastAPI + 前端 Streamlit + Ollama
REM ==========================

echo 启动前请确保 ollama serve 已经运行
echo 如果未运行，请在另一个命令行执行: ollama serve

REM --------------------------
REM 1. 后端
REM --------------------------
echo 启动后端 FastAPI (http://127.0.0.1:8000) ...
cd backend
pip install -r requirements.txt
start cmd /k "uvicorn main:app --reload --port 8000"
cd ..

REM --------------------------
REM 2. 前端
REM --------------------------
echo 启动前端 Streamlit (http://localhost:8501) ...
cd frontend
pip install streamlit requests -q
start cmd /k "streamlit run app.py"
cd ..

echo 所有服务已启动，请分别查看两个新弹出的命令行窗口
pause
