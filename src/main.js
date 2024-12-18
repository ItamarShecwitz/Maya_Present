
// Get the canvas element where the game will be drawn
const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');


// Define the player object
const player = {
    x: 0,  // Horizontal position of the player
    y: 0,  // Vertical position of the player
    width: 25,  // Player's width
    height: 25,  // Player's height
    color: 'white',  // Player's color
    speed: 2,  // Player's movement speed
    joystick_speed: 0.015,
};

// Define the background object
const background = {
    image: new Image(),  // Create a new image object
    x: 0,  // Horizontal position of the background
    y: 0,  // Vertical position of the background
    width: 3000,  // Width of the background image
    height: 2000,  // Height of the background image
};
background.image.src = 'sprites/background-image.png';  // Set the image source


function initializeGame() {
    resizeCanvas();  // Resize the canvas and center the player
}

// Resize the canvas and center the player when the window is resized
function resizeCanvas() {
    canvas.width = window.innerWidth;  // Set the canvas width to the window's width
    canvas.height = window.innerHeight;  // Set the canvas height to the window's height
    player.x = canvas.width / 2 - player.width / 2;  // Center the player horizontally
    player.y = canvas.height / 2 - player.height / 2;  // Center the player vertically
}


// Add an event listener for resizing the window
window.addEventListener('resize', resizeCanvas);

// Object to track the keys being pressed
const keys = {};

// Event listeners to track when keys are pressed or released
window.addEventListener('keydown', (e) => {
    keys[e.key] = true;  // Mark the key as being pressed
});
window.addEventListener('keyup', (e) => {
    keys[e.key] = false;  // Mark the key as released
});

var joystick	= new VirtualJoystick({
    // container: document.getElementById('gameCanvas'),
    strokeStyle: 'white',
    limitStickTravel: true,
    mouseSupport	: true,
    // stickElement:
});

// Function to draw the background image on the canvas
function drawBackground() {
    ctx.drawImage(background.image, background.x, background.y, background.width, background.height);
}

// Function to draw the player character on the canvas
function drawPlayer() {
    ctx.fillStyle = player.color;  // Set the player color
    ctx.fillRect(player.x, player.y, player.width, player.height);  // Draw the player as a rectangle
}

// Function to update the player's position based on keyboard input
function updatePlayer() {
    // Move the background when arrow keys or 'WASD' are pressed
    if (keys['ArrowUp'] || keys['w']) background.y += player.speed;
    if (keys['ArrowDown'] || keys['s']) background.y -= player.speed;
    if (keys['ArrowLeft'] || keys['a']) background.x += player.speed;
    if (keys['ArrowRight'] || keys['d']) background.x -= player.speed;

    // Use the joystick to update the player position
    background.x -= joystick.deltaX() * player.joystick_speed;
    background.y -= joystick.deltaY() * player.joystick_speed;

    // if (joystick.up()) player.y -= player.speed;  // Move up
    // if (joystick.down()) player.y += player.speed;  // Move down
    // if (joystick.left()) player.x -= player.speed;  // Move left
    // if (joystick.right()) player.x += player.speed;  // Move right

    // Keep the background within the canvas bounds
    background.x = Math.min(0, Math.max(canvas.width - background.width, background.x));
    background.y = Math.min(0, Math.max(canvas.height - background.height, background.y));
}

// The game loop function that runs continuously to update and render the game
function gameLoop() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);  // Clear the canvas
    drawBackground();  // Draw the background
    updatePlayer();  // Update the player's position
    drawPlayer();  // Draw the player
    requestAnimationFrame(gameLoop);  // Request the next frame
}

// Start the game when the background image is loaded
background.image.onload = () => {
// initializeGame();
    resizeCanvas();  // Resize the canvas and center the player
gameLoop();  // Start the game loop
};
