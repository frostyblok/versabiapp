import { Controller } from "stimulus"

export default class extends Controller {
	static targets = [ "password", "passwordToggle" ];

	togglePassword() {
		this.passwordToggleTarget.classList.toggle('fa-eye-slash');
		const input = this.passwordTarget;
		const inputType = input.getAttribute('type');

		if (inputType === 'password') {
			input.setAttribute('type', 'text')
		} else {
			input.setAttribute('type', 'password');
		}
	}
}
