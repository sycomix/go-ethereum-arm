#!/bin/bash

LATEST=$(git tag | sort -rV | head -n 1)

if [ "${LATEST}" == "${CI_COMMIT_TAG}" ]; then 
    docker tag ${DOCKER_NS}/${BASENAME}:${CI_COMMIT_TAG} ${DOCKER_NS}/${BASENAME}:stable;
    docker tag ${DOCKER_NS}/${BASENAME}:alltools-${CI_COMMIT_TAG} ${DOCKER_NS}/${BASENAME}:alltools-stable;
    docker tag ${DOCKER_NS}/${BASENAME}-little-DAG:${CI_COMMIT_TAG} ${DOCKER_NS}/${BASENAME}-little-DAG:stable;
    docker tag ${DOCKER_NS}/${BASENAME}-little-DAG:alltools-${CI_COMMIT_TAG} ${DOCKER_NS}/${BASENAME}-little-DAG:alltools-stable;
fi
