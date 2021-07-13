import os
from os.path import isfile, join
from os import listdir
import jinja2
from jinja2 import Template

folders = [f.name for f in os.scandir("entries") if f.is_dir()]
entries = []

for entry in folders:
    screenshots = []
    path = f"entries/{entry}"
    base_gh_path = f"https://gbajam21.github.io/entries/{entry}"
    files = [f for f in listdir(path) if isfile(join(path, f))]
    for file in files:
        if file[-3:].lower() == "jpg" or file[-3:].lower() == "png":
            screenshots.append(f"{base_gh_path}/{file}")
        if file[-3:].lower() == "gba":
            rom = f"{base_gh_path}/{file}"
    game = {}
    game["screenshots"] = screenshots
    game["rom"] = rom
    game["title"] = entry
    game["foldername"] = entry
    entries.append(game)


jinja_env = jinja2.Environment(loader=jinja2.FileSystemLoader(os.path.abspath(".")))

template = jinja_env.get_template("readme.j2")

with open("README.md", "w") as file:
    file.write(template.render(entries=entries))
    print("finished")
