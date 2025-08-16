# import asyncio
# from pydantic_model.chat_body import ChatBody 
# from fastapi import FastAPI, WebSocket
# from LLM_services import LLMservices
# from services.sort_source import sortSourcesServices
# from services.search_services import SearchServices
# app = FastAPI()

# search_services = SearchServices()
# sort_source_services = sortSourcesServices()
# llm_service = LLMservices()

# # chat webSOCKET
# @app.websocket("/ws/chat")
# async def websocket_chat_endpoint(websocket: WebSocket):
#     await websocket.accept()

#     try:
#         await asyncio.sleep(0.1)
#         data = await websocket.receive_json()
#         query = data.get("query")

#         seacrh_results = search_services.web_searches(query)
#         sorted_results =  sort_source_services.sort_sources(query, seacrh_results)
#         print("hi",sorted_results)
#         await asyncio.sleep(0.1)
#         await websocket.send_json({"type":"search_result","data":sorted_results})
#         print("hi")
#         for chunk in llm_service.generate_response(query, sorted_results):
#             await asyncio.sleep(0.1)
#             await websocket.send_json({type:"content","data":chunk})

#     except:
#         print("Unexpected Error occured!")
#     finally:
#         await websocket.close()


# # chat/query or question is ?
# #http post chat endpoint
# @app.post("/chat")
# def chat_endpoints(body: ChatBody):
#     # Searching Query
#     seacrh_results = search_services.web_searches(body.query)
#     print(seacrh_results)
#     #Sort the sources
#     sorted_results =  sort_source_services.sort_sources(body.query, seacrh_results)
#     print(sorted_results)
#     # Genrate the response using LLM
#     response = llm_service.generate_response(body.query, sorted_results)
#     return response

import asyncio
from pydantic_model.chat_body import ChatBody 
from fastapi import FastAPI, WebSocket
from services.LLM_services import LLMService
from services.sort_source import SortSourceService
from services.search_services import SearchService


app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()


# chat websocket
@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        query = data.get("query")
        search_results = search_service.web_search(query)
        sorted_results = sort_source_service.sort_sources(query, search_results)
        await asyncio.sleep(0.1)
        await websocket.send_json({"type": "search_result", "data": sorted_results})
        for chunk in llm_service.generate_response(query, sorted_results):
            await asyncio.sleep(0.1)
            await websocket.send_json({"type": "content", "data": chunk})

    except:
        print("Unexpected error occurred")
    finally:
        await websocket.close()


# chat
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    search_results = search_service.web_search(body.query)

    sorted_results = sort_source_service.sort_sources(body.query, search_results)

    response = llm_service.generate_response(body.query, sorted_results)

    return response

