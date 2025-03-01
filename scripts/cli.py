from typing import List

import typer

from app.update_values import ValuesFileUpdater
from app.update_apv import append_apv

k8s_app = typer.Typer()

@k8s_app.command()
def update_values(
    file_path_at_github: str = typer.Argument(
        ..., help="e.g. 9c-main/chart/values.yaml"
    ),
    sources: List[str] = typer.Argument(
        ...,
        help="Please send formatted text like this: [service key in the YAML file|Docker Hub repository name|image tag to change] (e.g. 'remoteHeadless|planetariumhq/ninechronicles-headless|from planetarium/NineChronicles.Headless tag 1', 'dataProvider|planetariumhq/ninechronicles-dataprovider|from planetarium/NineChronicles.DataProvider branch main', 'worldBoss|planetariumhq/world-boss-service|from planetarium/world-boss-service commit 2dfn2988d8f7')",
    ),
):
    """
    Update images like headless, data-provider, seed...

    """

    ValuesFileUpdater().update(file_path_at_github, sources)

@k8s_app.command()
def update_apv(
    number: int,
    cluster_name: str = typer.Argument(
        ...,
        help="9c-internal or 9c-main",
    ),
    network: str = typer.Argument(
        ...,
        help="all, odin, heimdall, ...",
    ),
):
    """
    Run post deploy script
    """

    append_apv(number, cluster_name, network)  # type:ignore

if __name__ == "__main__":
    k8s_app()
