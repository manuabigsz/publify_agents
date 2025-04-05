#!/usr/bin/env python
import sys
import warnings

from datetime import datetime

from .crew import PublifyApi

warnings.filterwarnings("ignore", category=SyntaxWarning, module="pysbd")

def run(topic, content, social_network):
    """
    Run the crew with a topic and specific content.
    """
    inputs = {
        'topic': topic,
        'content': content,
        'social_network': social_network,
        'current_year': str(datetime.now().year)
    }
    
    try:
        result = PublifyApi().crew().kickoff(inputs=inputs)
        return result  # agora retorna o conteúdo gerado
    except Exception as e:
        raise Exception(f"An error occurred while running the crew: {e}")
