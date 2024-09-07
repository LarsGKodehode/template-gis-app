# Combine all steps: build, tag, and publish
publish application:
    #!/usr/bin/env bash
    local_repo="localhost:5000"
    outTar="result"

    nix build .#{{application}}

    buildId=$(tar -xzOf ${outTar} manifest.json | jq -r '[.[] | .RepoTags[]] | .[]')
    docker load < ${outTar}

    imageName=$(echo ${buildId} | sed 's/[:].*//')
    uniqueTag=$(echo ${buildId} | sed 's/.*[:]//')
    latestTag="latest"

    docker tag ${buildId} ${local_repo}/${imageName}:${uniqueTag}
    docker tag ${buildId} ${local_repo}/${imageName}:${latestTag}
    echo "Tagged ${buildId} and ${latestTag}"

    docker push ${local_repo}/${imageName}:${imageName}
    docker push ${local_repo}/${imageName}:latest
    echo "Pushed image: ${imageName} to ${local_repo} with tags:"
    echo -e "\t${uniqueTag}"
    echo -e "\t${latestTag}"

    echo "Built, tagged, and published ${application} container"
