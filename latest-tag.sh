#!/bin/bash

LATEST=$(git tag | sort -rV | head -n 1)

if [ "${LATEST}" == "${CI_COMMIT_TAG}" ]; then 
    docker tag ${DOCKER_NS}/${BASENAME}-${ARMVER}:${CI_COMMIT_TAG} ${DOCKER_NS}/${BASENAME}-${ARMVER}:stable;
    docker tag ${DOCKER_NS}/${BASENAME}-${ARMVER}:alltools-${CI_COMMIT_TAG} ${DOCKER_NS}/${BASENAME}-${ARMVER}:alltools-stable;
    docker tag ${DOCKER_NS}/${BASENAME}-${ARMVER}-little-dag:${CI_COMMIT_TAG} ${DOCKER_NS}/${BASENAME}-little-dag:stable;
    docker tag ${DOCKER_NS}/${BASENAME}-${ARMVER}-little-dag:alltools-${CI_COMMIT_TAG} ${DOCKER_NS}/${BASENAME}-little-dag:alltools-stable;
fi
