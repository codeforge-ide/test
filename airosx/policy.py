# policy.py: Policy engine for compliance, parental controls, etc.

class PolicyEngine:
    def __init__(self):
        print("[PolicyEngine] Initialized")
        self.policies = {}

    def set_policy(self, name, rule):
        self.policies[name] = rule
        print(f"[PolicyEngine] Policy set: {name} = {rule}")

    def check_policy(self, name, context):
        print(f"[PolicyEngine] Checking policy: {name} for {context}")
        return self.policies.get(name, True)
