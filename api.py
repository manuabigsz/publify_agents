from fastapi import FastAPI
from pydantic import BaseModel
from src.publify_api.main import run

app = FastAPI()

class InputData(BaseModel):
    topic: str
    url: str
    platform: str
    text_lenght: str
    target_public:str
    tone: str
    
@app.post("/generate")
def generate_content(data: InputData):
    try:
        result = run(data.topic, data.url, data.platform, data.text_lenght, data.target_public,data.tone)
        return {"result": result}
    except Exception as e:
        return {"error": str(e)}
