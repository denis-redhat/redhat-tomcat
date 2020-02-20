#!/usr/bin/env python
import requests
import re
import docker

def mycurl(url):
  r = requests.get(url, allow_redirects=True)
  return r.status_code, r.text

#====== Unit tests =======
curlResult = mycurl("http://localhost:8080/sample")
pattern = ".*This is the home page for a sample application.*"

client = docker.from_env()
container = (client.containers.get("redhat-tomcat"))

def test_docker_container_running():
  assert container.status == "running"

def test_status_code():
  assert curlResult[0] == 200

def test_page_content():
  string = curlResult[1]
  result = re.search(pattern , string)
  assert result
