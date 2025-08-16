# import google.generativeai as genai
# from config import Settings
# settings = Settings()


# class LLMservices:
#     def __init__(self):
#         genai.configure(api_key=settings.GEMINI_API_KEY)
#         self.model = genai.GenerativeModel("gemini-2.5-pro")

#     def generate_response(self, query:str, search_result: list[dict]):
#         #Content from web search:
#         #Source 1 <url>
#         #<Content>
#         # Source 2  <URl>
#         #<Content>
#         content_text = "\n\n".join
#         (
#             [
#             f"Fource {i+1} ({result['url']}):\n{result['content']}"
#             for i, result in enumerate(search_result)
#             ]
#         )
#         full_prompt = f"""
#           Content from web search:
#           {content_text}
#           query: {query}
#         Using the provided context, generate a comprehensive, detailed, and well-cited response that directly addresses the user's query. Prioritize reasoning and critical thinking based on the given information.
#         Only rely on external knowledge when absolutely necessary, and clearly indicate when doing so.
#         """

#         response = self.model.generate_content(full_prompt, stream=True)

#         for chunk in response:
#             yield chunk.text


import google.generativeai as genai
from config import Settings

settings = Settings()


class LLMService:
    def __init__(self):
        genai.configure(api_key=settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel("gemini-2.0-flash-exp")

    def generate_response(self, query: str, search_results: list[dict]):

        context_text = "\n\n".join(
            [
                f"Source {i+1} ({result['url']}):\n{result['content']}"
                for i, result in enumerate(search_results)
            ]
        )

        full_prompt = f"""
        Context from web search:
        {context_text}

        Query: {query}

        Please provide a comprehensive, detailed, well-cited accurate response using the above context. 
        Think and reason deeply. Ensure it answers the query the user is asking. Do not use your knowledge until it is absolutely necessary.
        """

        response = self.model.generate_content(full_prompt, stream=True)

        for chunk in response:
            yield chunk.text