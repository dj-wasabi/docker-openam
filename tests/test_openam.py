import requests


def test_socker(Socket):
    assert Socket('tcp://:::8080').is_listening


def test_user_details(User):
    my_user = User("openam")
    assert my_user.uid == 1001
    assert my_user.home == '/home/openam'


def test_bootstrap(File):
    bootstrap = File("/openam/bootstrap")
    assert bootstrap.user == "openam"
    assert bootstrap.group == "openam"
    assert bootstrap.mode == 0o400


def test_http_status():
    openam = requests.get('http://openam.example.com:8080/openam/XUI/#login/')
    openam_status_code = openam.status_code
    assert openam_status_code == 200


def test_command(Command):
    cmd = Command("/openam/opends/bin/status -D 'cn=Directory Manager' -w password_opendj")

    assert cmd.rc == 0
