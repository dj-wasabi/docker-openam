
def test_socker(Socket):
    assert Socket('tcp://0.0.0.0:8080').is_listening


def test_user_details(User):
    my_user = User("openam")
    assert my_user.uid == 1001
    assert my_user.home == '/home/openam'


def test_jenkins_key_public(File):
    passwd = File("/opt/kibana/config/kibana.yml")
    assert passwd.user == "kibana"
    assert passwd.contains('server.port: 5601')
    assert passwd.contains('elasticsearch.url: "http://localhost:9200"')
    assert passwd.contains('kibana.index: ".kibana"')

