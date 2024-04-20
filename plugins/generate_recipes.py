

import json
from beet import Context, Recipe
from beet.contrib.vanilla import Vanilla

default_components = open('./plugins/components.json', 'r').read()
default_components = json.loads(default_components)

def beet_default(ctx: Context):
    vanilla = ctx.inject(Vanilla)
    minecraft = (
        vanilla.releases["1.20.5-rc2"]
           .mount("data/minecraft/recipes")
    )

    # with ctx.generate.draft() as draft:
        # draft.cache("recipes", len(minecraft.data.recipes), zipped=True)

    for [id, recipe] in minecraft.data.recipes.items():
        print(id)
        if "result" not in recipe.data:
            continue

        result: dict = recipe.data["result"]
        if "id" not in result:
            continue

        item = result["id"].split(':')[-1]
        components: list[dict] = default_components[item]
        
        for component in components:
            if component["type"].endswith("max_stack_size") and component["value"] == 64:
                result.setdefault("components", {})["minecraft:max_stack_size"] = 16
                ctx.data[id] = Recipe(recipe.data)