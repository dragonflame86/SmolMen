from beet import Context, ItemTag, Model
from beet.contrib.vanilla import Vanilla, ClientJar


def collect(minecraft: ClientJar, tag: ItemTag) -> list[str]:
    items = []
    values: list[str] = tag.data["values"]
    for v in values:
        if v.startswith("#"):
            items += collect(minecraft, minecraft.data.item_tags[v[1:]])
        else:
            items.append(v)
    return items

def scale_up_parent(model):
    for k in model['display']:
        display = model['display'][k]

        display['scale'] = [2.8 * s for s in display['scale']]

    return Model(model)

def beet_default(ctx: Context):
    minecraft = (
        ctx.inject(Vanilla)
        .mount("data/minecraft/tags/items")
        .mount("assets/minecraft/models")
    )
    yield

    tools_tag = ctx.data.item_tags["smolmen:tools"]

    tools = collect(minecraft, tools_tag)

    with ctx.generate.draft() as draft:
        draft.cache("scaled_modls", str("".join(tools)), zipped=True)
        for tool in tools:
            tool_id = tool.split(':')[1] 
            
            model_path = "minecraft:item/" + tool_id

            if model_path in ctx.assets.models:
                model = ctx.assets.models[model_path].data
            else:
                model = minecraft.assets.models[model_path].data
            


            model.setdefault("overrides", []).append(
                {
                    "predicate": { 
                        "custom_model_data": 1
                    },
                    "model": "smolmen:item/" + tool_id
                }
            )

            def key(override):
                return override["predicate"].setdefault("custom_model_data", 0)

            model["overrides"] = sorted(model["overrides"], key=key)

            draft.assets["minecraft:item/" + tool_id] = Model(model)

            model_parent = model["parent"].split(':')[-1] 
            if model_parent == "item/generated":
                model_parent = "item/handheld"

            if "smolmen:" + model_parent not in draft.assets.models:
                draft.assets["smolmen:" + model_parent] = scale_up_parent(minecraft.assets.models["minecraft:" + model_parent].data)

            draft.assets["smolmen:item/" + tool_id] = Model({
                "parent": "smolmen:" + model_parent,
                "textures": model["textures"] 
            })

