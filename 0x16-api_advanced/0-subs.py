#!/usr/bin/python3
"""
number of subscribers for a given subreddit
"""

from requests import get


def number_of_subscribers(subreddit):
    # Define the URL for the subreddit information
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    
    # Set a custom User-Agent
    headers = {'User-Agent': 'Python:subreddit.subscriber.count:v1.0 (by /u/yourusername)'}
    
    try:
        # Make the request to the Reddit API
        response = requests.get(url, headers=headers, allow_redirects=False)
        
        # Check if the response status code is 200 (OK)
        if response.status_code == 200:
            data = response.json()
            # Return the number of subscribers
            return data['data']['subscribers']
        else:
            # If the subreddit is not found or another error occurs, return 0
            return 0
    except Exception as e:
        # Handle any exceptions that occur and return 0
        return 0
