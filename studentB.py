import random


def ai_move(board):

    available_moves = [(i, j) for i in range(3) for j in range(3) if board[i][j] == " "]

    if not available_moves:
        return board  # If no available moves, return the current board

    new_board = [row[:] for row in board]  # Create a copy of the board
    move = random.choice(available_moves)
    new_board[move[0]][move[1]] = "O"
    return new_board


def get_user_move(board):

    while True:
        move = input("Choose the tile (0-8): ")

        # Check if the input is a digit
        if not move.isdigit():
            print("Invalid input! Must be a number")
            continue

        move = int(move)

        # Check if the input is a tile on board
        if move < 0 or move > 8:
            print("Invalid move! Choose from tiles 0-8.")
            continue

        # Convert the linear position to row and column indices
        row = move // 3
        col = move % 3

        # Check if the tile is free
        if board[row][col] != " ":
            print("Invalid move! This tile is already occupied.")
            continue

        new_board = [row[:] for row in board]  # Create a copy of the board
        new_board[row][col] = "X"
        return new_board


def is_player_starting():

    return random.choice([True, False])
