Indo contra o curso, eu instalei todas as libs nas ultimas versões disponíveis. Então os comandos de execução mudam.

- Openjdk: 25.0.2 
- Node: 24.15.0
- Appium: v3.3.1
- Appium Doctor: v.1.16.2
- Appium Inspector: 2026.2.1
- Python: 3.12
- Robot Framework: 7.4.2



-> Para executar o appium e usar o appium-inspector 

| $ npx appium --use-plugins=inspector

Com isso o servidor do appium vai ser iniciado e o inspector pode ser acessado pela URL: 

| $ http://127.0.0.1:4723/inspector



-> To run the tests

1. Open the Android Studio

| $ studio

2. Open appium server

| $ npx appium --use-plugins=inspector

3. Activate the virtual env

| $ source venv-robot/bin/activate

4. Run the robot tests

| $ robot --outputdir ./logs/results_$(date +%Y%m%d_%H%M%S) tests/