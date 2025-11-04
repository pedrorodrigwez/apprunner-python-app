from decimal import Decimal
import json
import boto3
import os


def load_movies(movies):
    # Especificar región por defecto si no está configurada
    region = os.environ.get('AWS_DEFAULT_REGION', 'us-east-1')
    dynamodb = boto3.resource('dynamodb', region_name=region)
    table = dynamodb.Table('Movies')
    
    for movie in movies:
        year = int(movie['year'])
        title = movie['title']
        print("Adding movie:", year, title)
        table.put_item(Item=movie)


if __name__ == '__main__':
    with open("moviedata.json") as json_file:
        movie_list = json.load(json_file, parse_float=Decimal)
    load_movies(movie_list)