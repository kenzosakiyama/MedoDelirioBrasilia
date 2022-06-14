from playsound import playsound
from random import choice
import os

SOUNDS_PATH = "/home/kenzo/repos/MedoDelirioBrasilia/MedoDelirioBrasilia/MedoDelirioBrasilia/Resources/Sounds/"

if __name__ == "__main__":

    all_files = os.listdir(SOUNDS_PATH)

    random_file = choice(all_files)
    print(f"Reproduzindo: {random_file}")

    playsound(SOUNDS_PATH + random_file)
