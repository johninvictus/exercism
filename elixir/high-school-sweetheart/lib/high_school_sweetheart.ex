defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    name =
      name
      |> first_letter()
      |> String.upcase()

    name <> "."
  end

  def initials(full_name) do
    [first, second] = String.split(full_name, " ")

    "#{initial(first)} #{initial(second)}"
  end

  def pair(full_name1, full_name2) do
    n1 = initials(full_name1)
    n2 = initials(full_name2)

    """
                    ******       ******
                  **      **   **      **
                **         ** **         **
               **            *            **
               **                         **
               **     #{n1}  +  #{n2}     **
                **                       **
                  **                   **
                    **               **
                      **           **
                        **       **
                          **   **
                            ***
                             *
               """

    # Please implement the pair/2 function
  end
end
