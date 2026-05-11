from pathlib import Path

from pentest_orchestrator.models import Finding
from pentest_orchestrator.rules import RuleEngine


def test_rule_engine_matches_web_port_rule() -> None:
    rules = Path(__file__).resolve().parents[1] / "pentest_orchestrator" / "config" / "default_rules.json"
    engine = RuleEngine(rules)

    findings = [
        Finding(
            source="nmap",
            title="Open port 80/tcp",
            evidence="127.0.0.1:80/tcp service=http",
            meta={"port": "80", "service": "http", "banner": "nginx"},
        )
    ]

    actions = engine.evaluate(findings)
    assert any("directory bruteforce" in action.lower() for action in actions)


def test_rule_engine_deduplicates_actions() -> None:
    rules = Path(__file__).resolve().parents[1] / "pentest_orchestrator" / "config" / "default_rules.json"
    engine = RuleEngine(rules)

    findings = [
        Finding(source="nmap", title="nmap is not installed", evidence="missing"),
        Finding(source="nmap", title="nmap is not installed", evidence="missing"),
    ]

    actions = engine.evaluate(findings)
    assert len(actions) == len(set(actions))
