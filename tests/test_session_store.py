from pathlib import Path

from pentest_orchestrator.models import SessionStatus
from pentest_orchestrator.session_store import SessionStore


def test_session_store_create_save_load(tmp_path: Path) -> None:
    store = SessionStore(base_dir=tmp_path)
    session = store.create(target="127.0.0.1", profile="web")

    assert session.status == SessionStatus.RUNNING
    assert session.session_id

    loaded = store.load(session.session_id)
    assert loaded is not None
    assert loaded.target == "127.0.0.1"
    assert loaded.profile == "web"
