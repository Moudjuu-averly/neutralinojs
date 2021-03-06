# MIT License

# Copyright (c) 2018 Neutralinojs

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


echo "Neutralino is being built.."
if [ -e bin/neutralino ]; then
    rm bin/neutralino
fi

g++ -I ../core-shared -std=c++17 ../core-shared/log.cpp ../core-shared/resources.cpp src/server/Buffer.cpp src/server/Handler.cpp src/server/requestparser.cpp src/server/Socket.cpp ../core-shared/helpers.cpp src/main.cpp ../core-shared/router.cpp src/api/filesystem/filesystem.cpp src/platform/linux.cpp ../core-shared/settings.cpp src/api/os/os.cpp src/api/computer/computer.cpp src/api/debug/debug.cpp ../core-shared/auth/authbasic.cpp ../core-shared/ping/ping.cpp src/api/storage/storage.cpp src/api/app/app.cpp ../core-shared/cloud/privileges.cpp -pthread -std=c++17 -DWEBVIEW_GTK=1 `pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0` -o bin/neutralino -no-pie -lstdc++fs

if [ -e bin/neutralino ]; then
    echo "Neutralino binary is compiled in to bin/neutralino"
else
    echo "ERR : Neutralino binary is not compiled"
fi
