from studentA import print_board, is_game_over, new_board
from studentB import ai_move, get_user_move, is_player_starting

board = new_board()
players_move = is_player_starting()
# print_board(board)

def announce_outcome(board, player_starts):

    if is_game_over(board):
        if any(row.count("X") == 3 or row.count("O") == 3 for row in board):
            print("Congratulations! You win!")
        elif any(board[0][i] == board[1][i] == board[2][i] != " " for i in range(3)):
            print("Congratulations! You win!")
        elif (board[0][0] == board[1][1] == board[2][2] != " ") or (board[0][2] == board[1][1] == board[2][0] != " "):
            print("Congratulations! You win!")
        else:
            print("It's a draw!")
    else:
        print("The game is not yet over.")

while not is_game_over(board):
    print_board(board)
    board = get_user_move(board) if players_move else ai_move(board)
    players_move = not players_move

announce_outcome(board, players_move)



