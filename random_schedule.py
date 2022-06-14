import os
import numpy as np
from playsound import playsound
import schedule

SOUNDS_PATH = "/home/kenzo/repos/MedoDelirioBrasilia/MedoDelirioBrasilia/MedoDelirioBrasilia/Resources/Sounds/"

def play_random_sound() -> None:

    files = os.listdir(SOUNDS_PATH)
    random_sound = np.random.choice(files)
    print(f"- Reproduzindo: {random_sound}")

    playsound(SOUNDS_PATH + random_sound)


if __name__ == "__main__":

    schedule.every(15).seconds.do(play_random_sound)

    while True:
        schedule.run_pending()
    
