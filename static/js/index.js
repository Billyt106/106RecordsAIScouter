document.getElementById('useAiScouterButton').addEventListener('click', function() {
    // Get the button element
    const button = document.getElementById('useAiScouterButton');

    // Hide the button
    button.style.display = 'none';

    const instaUsername = document.getElementById('instaUsername').value;
    const password = document.getElementById('password').value;

    fetch('/backend', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            insta_username: instaUsername,
            password: password,
        }),
    })
    .then(response => response.json())
    .then(data => {
        // Show success message
        document.getElementById('successMessage').innerText = data.message;
        document.getElementById('successMessage').style.display = 'block';

        // Re-display the button
        button.style.display = 'block';
    })
    .catch((error) => {
        console.error('Error:', error);

        // Show error message
        document.getElementById('errorMessage').innerText = 'Error starting the script';
        document.getElementById('errorMessage').style.display = 'block';

        // Re-display the button
        button.style.display = 'block';
    });
});
