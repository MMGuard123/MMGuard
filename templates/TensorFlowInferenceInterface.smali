.class public Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;
.super Ljava/lang/Object;
.source "TensorFlowInferenceInterface.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;
    }
.end annotation


# static fields
.field private static final ASSET_FILE_PREFIX:Ljava/lang/String; = "file:///android_asset/"

.field private static final TAG:Ljava/lang/String; = "TensorFlowInferenceInterface"


# instance fields
.field private feedNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private feedTensors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/tensorflow/Tensor",
            "<*>;>;"
        }
    .end annotation
.end field

.field private fetchNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private fetchTensors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/tensorflow/Tensor",
            "<*>;>;"
        }
    .end annotation
.end field

.field private flag:Z

.field private final g:Lorg/tensorflow/Graph;

.field private final modelName:Ljava/lang/String;

.field private runStats:Lorg/tensorflow/contrib/android/RunStats;

.field private runner:Lorg/tensorflow/Session$Runner;

.field private final sess:Lorg/tensorflow/Session;

.field private hashType:Ljava/lang/String;

.field private ran:Ljava/util/Random;

.field private shapes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<[J>;"
        }
    .end annotation
.end field

.field private sign:J

.field private signinput:I

.field private sizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V
    .locals 11
    .param p1, "assetManager"    # Landroid/content/res/AssetManager;
    .param p2, "model"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    const/16 v10, 0x12

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const-string/jumbo v7, "MD5"

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->hashType:Ljava/lang/String;

    .line 78
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->shapes:Ljava/util/List;

    .line 79
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sizes:Ljava/util/List;

    .line 80
    iput v8, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->signinput:I

    .line 82
    iput-boolean v8, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->flag:Z

    .line 806
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedNames:Ljava/util/List;

    .line 807
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedTensors:Ljava/util/List;

    .line 808
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchNames:Ljava/util/List;

    .line 809
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchTensors:Ljava/util/List;

    .line 161
    invoke-direct {p0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->prepareNativeRuntime()V

    .line 163
    iput-object p2, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->modelName:Ljava/lang/String;

    .line 164
    new-instance v7, Lorg/tensorflow/Graph;

    invoke-direct {v7}, Lorg/tensorflow/Graph;-><init>()V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    .line 165
    new-instance v7, Lorg/tensorflow/Session;

    iget-object v8, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    invoke-direct {v7, v8}, Lorg/tensorflow/Session;-><init>(Lorg/tensorflow/Graph;)V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sess:Lorg/tensorflow/Session;

    .line 166
    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sess:Lorg/tensorflow/Session;

    invoke-virtual {v7}, Lorg/tensorflow/Session;->runner()Lorg/tensorflow/Session$Runner;

    move-result-object v7

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    .line 168
    const-string/jumbo v7, "file:///android_asset/"

    invoke-virtual {p2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    .line 169
    .local v4, "hasAssetPrefix":Z
    const/4 v5, 0x0

    .line 171
    .local v5, "is":Ljava/io/InputStream;
    if-eqz v4, :cond_1

    :try_start_0
    const-string/jumbo v7, "file:///android_asset/"

    invoke-virtual {p2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    aget-object v0, v7, v8

    .line 172
    .local v0, "aname":Ljava/lang/String;
    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 186
    .end local v0    # "aname":Ljava/lang/String;
    :goto_1
    :try_start_1
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v7, v10, :cond_0

    .line 187
    const-string/jumbo v7, "initializeTensorFlow"

    invoke-static {v7}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 188
    const-string/jumbo v7, "readGraphDef"

    invoke-static {v7}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 192
    :cond_0
    invoke-virtual {v5}, Ljava/io/InputStream;->available()I

    move-result v7

    new-array v3, v7, [B

    .line 193
    .local v3, "graphDef":[B
    invoke-virtual {v5, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .line 194
    .local v6, "numBytesRead":I
    array-length v7, v3

    if-eq v6, v7, :cond_3

    .line 195
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "read error: read only "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " of the graph, expected to read "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    array-length v9, v3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 219
    .end local v3    # "graphDef":[B
    .end local v6    # "numBytesRead":I
    :catch_0
    move-exception v1

    .line 220
    .local v1, "e":Ljava/io/IOException;
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Failed to load model from \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .end local v1    # "e":Ljava/io/IOException;
    :cond_1
    move-object v0, p2

    .line 171
    goto :goto_0

    .line 173
    :catch_1
    move-exception v1

    .line 174
    .restart local v1    # "e":Ljava/io/IOException;
    if-eqz v4, :cond_2

    .line 175
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Failed to load model from \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 179
    :cond_2
    :try_start_2
    new-instance v5, Ljava/io/FileInputStream;

    .end local v5    # "is":Ljava/io/InputStream;
    invoke-direct {v5, p2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .restart local v5    # "is":Ljava/io/InputStream;
    goto/16 :goto_1

    .line 180
    .end local v5    # "is":Ljava/io/InputStream;
    :catch_2
    move-exception v2

    .line 181
    .local v2, "e2":Ljava/io/IOException;
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Failed to load model from \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 202
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "e2":Ljava/io/IOException;
    .restart local v3    # "graphDef":[B
    .restart local v5    # "is":Ljava/io/InputStream;
    .restart local v6    # "numBytesRead":I
    :cond_3
    :try_start_3
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v7, v10, :cond_4

    .line 203
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 206
    :cond_4
    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    invoke-direct {p0, v3, v7}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->loadGraph([BLorg/tensorflow/Graph;)V

    .line 207
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 208
    const-string/jumbo v7, "TensorFlowInferenceInterface"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Successfully loaded model from \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v7, v10, :cond_5

    .line 211
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 215
    :cond_5
    const-string/jumbo v7, "TensorFlowInferenceInterface"

    const-string/jumbo v8, "before getInputInfo"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    invoke-direct {p0, p1, v3}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->getInputInfo(Landroid/content/res/AssetManager;[B)V

    .line 217
    const-string/jumbo v7, "TensorFlowInferenceInterface"

    const-string/jumbo v8, "after getInputInfo"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 222
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 9
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    const/16 v1, 0x4000

    const/16 v8, 0x12

    const/4 v7, 0x0

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const-string/jumbo v6, "MD5"

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->hashType:Ljava/lang/String;

    .line 78
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->shapes:Ljava/util/List;

    .line 79
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sizes:Ljava/util/List;

    .line 80
    iput v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->signinput:I

    .line 82
    iput-boolean v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->flag:Z

    .line 806
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedNames:Ljava/util/List;

    .line 807
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedTensors:Ljava/util/List;

    .line 808
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchNames:Ljava/util/List;

    .line 809
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchTensors:Ljava/util/List;

    .line 232
    invoke-direct {p0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->prepareNativeRuntime()V

    .line 236
    const-string/jumbo v6, ""

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->modelName:Ljava/lang/String;

    .line 237
    new-instance v6, Lorg/tensorflow/Graph;

    invoke-direct {v6}, Lorg/tensorflow/Graph;-><init>()V

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    .line 238
    new-instance v6, Lorg/tensorflow/Session;

    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    invoke-direct {v6, v7}, Lorg/tensorflow/Session;-><init>(Lorg/tensorflow/Graph;)V

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sess:Lorg/tensorflow/Session;

    .line 239
    iget-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sess:Lorg/tensorflow/Session;

    invoke-virtual {v6}, Lorg/tensorflow/Session;->runner()Lorg/tensorflow/Session$Runner;

    move-result-object v6

    iput-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    .line 242
    :try_start_0
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v6, v8, :cond_0

    .line 243
    const-string/jumbo v6, "initializeTensorFlow"

    invoke-static {v6}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 244
    const-string/jumbo v6, "readGraphDef"

    invoke-static {v6}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 247
    :cond_0
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v6

    if-le v6, v1, :cond_1

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v1

    .line 248
    .local v1, "baosInitSize":I
    :cond_1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 250
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v6, 0x4000

    new-array v2, v6, [B

    .line 251
    .local v2, "buf":[B
    :goto_0
    const/4 v6, 0x0

    array-length v7, v2

    invoke-virtual {p1, v2, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .local v5, "numBytesRead":I
    const/4 v6, -0x1

    if-eq v5, v6, :cond_2

    .line 252
    const/4 v6, 0x0

    invoke-virtual {v0, v2, v6, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 266
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "baosInitSize":I
    .end local v2    # "buf":[B
    .end local v5    # "numBytesRead":I
    :catch_0
    move-exception v3

    .line 267
    .local v3, "e":Ljava/io/IOException;
    new-instance v6, Ljava/lang/RuntimeException;

    const-string/jumbo v7, "Failed to load model from the input stream"

    invoke-direct {v6, v7, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 254
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "baosInitSize":I
    .restart local v2    # "buf":[B
    .restart local v5    # "numBytesRead":I
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    .line 256
    .local v4, "graphDef":[B
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v6, v8, :cond_3

    .line 257
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 260
    :cond_3
    iget-object v6, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    invoke-direct {p0, v4, v6}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->loadGraph([BLorg/tensorflow/Graph;)V

    .line 261
    const-string/jumbo v6, "TensorFlowInferenceInterface"

    const-string/jumbo v7, "Successfully loaded model from the input stream"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v6, v8, :cond_4

    .line 264
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 269
    :cond_4
    return-void
.end method

.method public constructor <init>(Lorg/tensorflow/Graph;)V
    .locals 2
    .param p1, "g"    # Lorg/tensorflow/Graph;

    .prologue
    const/4 v1, 0x0

    .line 276
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const-string/jumbo v0, "MD5"

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->hashType:Ljava/lang/String;

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->shapes:Ljava/util/List;

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sizes:Ljava/util/List;

    .line 80
    iput v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->signinput:I

    .line 82
    iput-boolean v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->flag:Z

    .line 806
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedNames:Ljava/util/List;

    .line 807
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedTensors:Ljava/util/List;

    .line 808
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchNames:Ljava/util/List;

    .line 809
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchTensors:Ljava/util/List;

    .line 277
    invoke-direct {p0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->prepareNativeRuntime()V

    .line 281
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->modelName:Ljava/lang/String;

    .line 282
    iput-object p1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    .line 283
    new-instance v0, Lorg/tensorflow/Session;

    invoke-direct {v0, p1}, Lorg/tensorflow/Session;-><init>(Lorg/tensorflow/Graph;)V

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sess:Lorg/tensorflow/Session;

    .line 284
    iget-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sess:Lorg/tensorflow/Session;

    invoke-virtual {v0}, Lorg/tensorflow/Session;->runner()Lorg/tensorflow/Session$Runner;

    move-result-object v0

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    .line 285
    return-void
.end method

.method private addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V
    .locals 4
    .param p1, "inputName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/tensorflow/Tensor",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 576
    .local p2, "t":Lorg/tensorflow/Tensor;, "Lorg/tensorflow/Tensor<*>;"
    invoke-static {p1}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;->parse(Ljava/lang/String;)Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;

    move-result-object v0

    .line 577
    .local v0, "tid":Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    iget-object v2, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;->name:Ljava/lang/String;

    iget v3, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;->outputIndex:I

    invoke-virtual {v1, v2, v3, p2}, Lorg/tensorflow/Session$Runner;->feed(Ljava/lang/String;ILorg/tensorflow/Tensor;)Lorg/tensorflow/Session$Runner;

    .line 578
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedNames:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 579
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedTensors:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 580
    return-void
.end method

.method private closeFeeds()V
    .locals 3

    .prologue
    .line 621
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedTensors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tensorflow/Tensor;

    .line 622
    .local v0, "t":Lorg/tensorflow/Tensor;, "Lorg/tensorflow/Tensor<*>;"
    invoke-virtual {v0}, Lorg/tensorflow/Tensor;->close()V

    goto :goto_0

    .line 624
    .end local v0    # "t":Lorg/tensorflow/Tensor;, "Lorg/tensorflow/Tensor<*>;"
    :cond_0
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedTensors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 625
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedNames:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 626
    return-void
.end method

.method private closeFetches()V
    .locals 3

    .prologue
    .line 629
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchTensors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tensorflow/Tensor;

    .line 630
    .local v0, "t":Lorg/tensorflow/Tensor;, "Lorg/tensorflow/Tensor<*>;"
    invoke-virtual {v0}, Lorg/tensorflow/Tensor;->close()V

    goto :goto_0

    .line 632
    .end local v0    # "t":Lorg/tensorflow/Tensor;, "Lorg/tensorflow/Tensor<*>;"
    :cond_0
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchTensors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 633
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchNames:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 634
    return-void
.end method

.method private getInputInfo(Landroid/content/res/AssetManager;[B)V
    .locals 22
    .param p1, "assetManager"    # Landroid/content/res/AssetManager;
    .param p2, "graphDef"    # [B

    .prologue
    .line 87
    :try_start_0
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v18, Ljava/io/InputStreamReader;

    const-string/jumbo v19, "inputinfo"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v18

    invoke-direct {v6, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 88
    .local v6, "br":Ljava/io/BufferedReader;
    const-string/jumbo v16, ""

    .line 89
    .local v16, "next":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->modelName:Ljava/lang/String;

    move-object/from16 v18, v0

    const-string/jumbo v19, "file:///android_asset/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    .line 90
    .local v12, "hasAssetPrefix":Z
    if-eqz v12, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->modelName:Ljava/lang/String;

    move-object/from16 v18, v0

    const-string/jumbo v19, "file:///android_asset/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x1

    aget-object v4, v18, v19

    .line 92
    .local v4, "aname":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_4

    .line 93
    const-string/jumbo v18, "TensorFlowInferenceInterface"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "next:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    const-string/jumbo v18, "TensorFlowInferenceInterface"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "aname:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 96
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v16

    .line 97
    if-eqz v16, :cond_1

    const-string/jumbo v18, "------"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 153
    :cond_1
    :goto_1
    return-void

    .line 90
    .end local v4    # "aname":Ljava/lang/String;
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->modelName:Ljava/lang/String;

    goto :goto_0

    .line 101
    .restart local v4    # "aname":Ljava/lang/String;
    :cond_3
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->flag:Z

    .line 106
    :cond_4
    const-string/jumbo v18, "TensorFlowInferenceInterface"

    const-string/jumbo v19, "hhh"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->flag:Z

    move/from16 v18, v0

    if-eqz v18, :cond_1

    .line 109
    move-object/from16 v15, v16

    .line 110
    .local v15, "md5":Ljava/lang/String;
    const-string/jumbo v18, "TensorFlowInferenceInterface"

    move-object/from16 v0, v18

    invoke-static {v0, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->hashType:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v13

    .line 117
    .local v13, "hash":Ljava/security/MessageDigest;
    :try_start_2
    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 118
    invoke-virtual {v13}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v18

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v7

    .line 119
    .local v7, "computedhash":Ljava/lang/String;
    const-string/jumbo v18, "\r"

    const-string/jumbo v19, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v19, "\n"

    const-string/jumbo v20, ""

    invoke-virtual/range {v18 .. v20}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 120
    const-string/jumbo v18, "TensorFlowInferenceInterface"

    move-object/from16 v0, v18

    invoke-static {v0, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_5

    .line 122
    const-string/jumbo v18, "TensorFlowInferenceInterface"

    const-string/jumbo v19, "md5 verification failed"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    new-instance v18, Ljava/lang/RuntimeException;

    const-string/jumbo v19, "md5 verification failed!"

    invoke-direct/range {v18 .. v19}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v18
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 149
    .end local v4    # "aname":Ljava/lang/String;
    .end local v6    # "br":Ljava/io/BufferedReader;
    .end local v7    # "computedhash":Ljava/lang/String;
    .end local v12    # "hasAssetPrefix":Z
    .end local v13    # "hash":Ljava/security/MessageDigest;
    .end local v15    # "md5":Ljava/lang/String;
    .end local v16    # "next":Ljava/lang/String;
    :catch_0
    move-exception v10

    .line 150
    .local v10, "e":Ljava/io/IOException;
    invoke-virtual {v10}, Ljava/io/IOException;->printStackTrace()V

    .line 151
    new-instance v18, Ljava/lang/RuntimeException;

    const-string/jumbo v19, "Failed to load inputinfo file \'inputinfo\'"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v10}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v18

    .line 114
    .end local v10    # "e":Ljava/io/IOException;
    .restart local v4    # "aname":Ljava/lang/String;
    .restart local v6    # "br":Ljava/io/BufferedReader;
    .restart local v12    # "hasAssetPrefix":Z
    .restart local v15    # "md5":Ljava/lang/String;
    .restart local v16    # "next":Ljava/lang/String;
    :catch_1
    move-exception v11

    .line 115
    .local v11, "e3":Ljava/lang/Exception;
    :try_start_3
    new-instance v18, Ljava/io/IOException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "No Such AlgorithmE:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v11}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 126
    .end local v11    # "e3":Ljava/lang/Exception;
    .restart local v7    # "computedhash":Ljava/lang/String;
    .restart local v13    # "hash":Ljava/security/MessageDigest;
    :cond_5
    new-instance v5, Ljava/math/BigInteger;

    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x2

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v5, v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 127
    .local v5, "bi":Ljava/math/BigInteger;
    invoke-virtual {v5}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sign:J

    .line 128
    const-string/jumbo v18, "TensorFlowInferenceInterface"

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sign:J

    move-wide/from16 v20, v0

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->signinput:I

    .line 131
    const-string/jumbo v18, "TensorFlowInferenceInterface"

    move-object/from16 v0, p0

    iget v0, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->signinput:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    :goto_2
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_6

    .line 134
    const-string/jumbo v18, "------"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_7

    .line 147
    :cond_6
    const-string/jumbo v18, "TensorFlowInferenceInterface"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->shapes:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 137
    :cond_7
    const-string/jumbo v18, ","

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 138
    .local v8, "d":[Ljava/lang/String;
    array-length v0, v8

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v9, v0, [J

    .line 139
    .local v9, "dims":[J
    const/16 v17, 0x1

    .line 140
    .local v17, "size":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_3
    array-length v0, v8

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v14, v0, :cond_8

    .line 141
    aget-object v18, v8, v14

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    mul-int v17, v17, v18

    .line 142
    aget-object v18, v8, v14

    invoke-static/range {v18 .. v18}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    aput-wide v18, v9, v14

    .line 140
    add-int/lit8 v14, v14, 0x1

    goto :goto_3

    .line 144
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sizes:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->shapes:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2
.end method

.method private getTensor(Ljava/lang/String;)Lorg/tensorflow/Tensor;
    .locals 5
    .param p1, "outputName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/tensorflow/Tensor",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 609
    const/4 v0, 0x0

    .line 610
    .local v0, "i":I
    iget-object v2, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchNames:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 611
    .local v1, "n":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 612
    iget-object v2, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchTensors:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/tensorflow/Tensor;

    return-object v2

    .line 614
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 615
    goto :goto_0

    .line 616
    .end local v1    # "n":Ljava/lang/String;
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Node \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' was not provided to run(), so it cannot be read"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private loadGraph([BLorg/tensorflow/Graph;)V
    .locals 10
    .param p1, "graphDef"    # [B
    .param p2, "g"    # Lorg/tensorflow/Graph;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x12

    .line 552
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 554
    .local v4, "startMs":J
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v6, :cond_0

    .line 555
    const-string v1, "importGraphDef"

    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 559
    :cond_0
    :try_start_0
    invoke-virtual {p2, p1}, Lorg/tensorflow/Graph;->importGraphDef([B)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 564
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v6, :cond_1

    .line 565
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 568
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 569
    .local v2, "endMs":J
    const-string v1, "TensorFlowInferenceInterface"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Model load took "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sub-long v8, v2, v4

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "ms, TensorFlow version: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 571
    invoke-static {}, Lorg/tensorflow/TensorFlow;->version()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 569
    invoke-static {v1, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 572
    return-void

    .line 560
    .end local v2    # "endMs":J
    :catch_0
    move-exception v0

    .line 561
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Not a valid TensorFlow Graph serialization: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private prepareNativeRuntime()V
    .locals 4

    .prologue
    .line 532
    const-string v2, "TensorFlowInferenceInterface"

    const-string v3, "Checking to see if TensorFlow native methods are already loaded"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    :try_start_0
    new-instance v2, Lorg/tensorflow/contrib/android/RunStats;

    invoke-direct {v2}, Lorg/tensorflow/contrib/android/RunStats;-><init>()V

    .line 536
    const-string v2, "TensorFlowInferenceInterface"

    const-string v3, "TensorFlow native methods already loaded"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 549
    :goto_0
    return-void

    .line 537
    :catch_0
    move-exception v0

    .line 538
    .local v0, "e1":Ljava/lang/UnsatisfiedLinkError;
    const-string v2, "TensorFlowInferenceInterface"

    const-string v3, "TensorFlow native methods not found, attempting to load via tensorflow_inference"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 541
    :try_start_1
    const-string v2, "tensorflow_inference"

    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 542
    const-string v2, "TensorFlowInferenceInterface"

    const-string v3, "Successfully loaded TensorFlow native methods (RunStats error may be ignored)"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 543
    :catch_1
    move-exception v1

    .line 544
    .local v1, "e2":Ljava/lang/UnsatisfiedLinkError;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Native TF methods not found; check that the correct native libraries are present in the APK."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 274
    invoke-direct {p0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->closeFeeds()V

    .line 275
    invoke-direct {p0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->closeFetches()V

    .line 276
    iget-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sess:Lorg/tensorflow/Session;

    invoke-virtual {v0}, Lorg/tensorflow/Session;->close()V

    .line 277
    iget-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    invoke-virtual {v0}, Lorg/tensorflow/Graph;->close()V

    .line 278
    iget-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runStats:Lorg/tensorflow/contrib/android/RunStats;

    if-eqz v0, :cond_0

    .line 279
    iget-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runStats:Lorg/tensorflow/contrib/android/RunStats;

    invoke-virtual {v0}, Lorg/tensorflow/contrib/android/RunStats;->close()V

    .line 281
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runStats:Lorg/tensorflow/contrib/android/RunStats;

    .line 282
    return-void
.end method

.method public varargs feed(Ljava/lang/String;Ljava/nio/ByteBuffer;[J)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # Ljava/nio/ByteBuffer;
    .param p3, "dims"    # [J

    .prologue
    .line 433
    const-class v0, Lorg/tensorflow/types/UInt8;

    invoke-static {v0, p3, p2}, Lorg/tensorflow/Tensor;->create(Ljava/lang/Class;[JLjava/nio/ByteBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 434
    return-void
.end method

.method public varargs feed(Ljava/lang/String;Ljava/nio/DoubleBuffer;[J)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # Ljava/nio/DoubleBuffer;
    .param p3, "dims"    # [J

    .prologue
    .line 422
    invoke-static {p3, p2}, Lorg/tensorflow/Tensor;->create([JLjava/nio/DoubleBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 423
    return-void
.end method

.method public varargs feed(Ljava/lang/String;Ljava/nio/FloatBuffer;[J)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # Ljava/nio/FloatBuffer;
    .param p3, "dims"    # [J

    .prologue
    .line 389
    invoke-static {p3, p2}, Lorg/tensorflow/Tensor;->create([JLjava/nio/FloatBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 390
    return-void
.end method

.method public varargs feed(Ljava/lang/String;Ljava/nio/IntBuffer;[J)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # Ljava/nio/IntBuffer;
    .param p3, "dims"    # [J

    .prologue
    .line 400
    invoke-static {p3, p2}, Lorg/tensorflow/Tensor;->create([JLjava/nio/IntBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 401
    return-void
.end method

.method public varargs feed(Ljava/lang/String;Ljava/nio/LongBuffer;[J)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # Ljava/nio/LongBuffer;
    .param p3, "dims"    # [J

    .prologue
    .line 411
    invoke-static {p3, p2}, Lorg/tensorflow/Tensor;->create([JLjava/nio/LongBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 412
    return-void
.end method

.method public varargs feed(Ljava/lang/String;[B[J)V
    .locals 2
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # [B
    .param p3, "dims"    # [J

    .prologue
    .line 358
    const-class v0, Lorg/tensorflow/types/UInt8;

    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-static {v0, p3, v1}, Lorg/tensorflow/Tensor;->create(Ljava/lang/Class;[JLjava/nio/ByteBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 359
    return-void
.end method

.method public varargs feed(Ljava/lang/String;[D[J)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # [D
    .param p3, "dims"    # [J

    .prologue
    .line 348
    invoke-static {p2}, Ljava/nio/DoubleBuffer;->wrap([D)Ljava/nio/DoubleBuffer;

    move-result-object v0

    invoke-static {p3, v0}, Lorg/tensorflow/Tensor;->create([JLjava/nio/DoubleBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 349
    return-void
.end method

.method public varargs feed(Ljava/lang/String;[F[J)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # [F
    .param p3, "dims"    # [J

    .prologue
    .line 318
    invoke-static {p2}, Ljava/nio/FloatBuffer;->wrap([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-static {p3, v0}, Lorg/tensorflow/Tensor;->create([JLjava/nio/FloatBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 319
    return-void
.end method

.method public varargs feed(Ljava/lang/String;[I[J)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # [I
    .param p3, "dims"    # [J

    .prologue
    .line 328
    invoke-static {p2}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    move-result-object v0

    invoke-static {p3, v0}, Lorg/tensorflow/Tensor;->create([JLjava/nio/IntBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 329
    return-void
.end method

.method public varargs feed(Ljava/lang/String;[J[J)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # [J
    .param p3, "dims"    # [J

    .prologue
    .line 338
    invoke-static {p2}, Ljava/nio/LongBuffer;->wrap([J)Ljava/nio/LongBuffer;

    move-result-object v0

    invoke-static {p3, v0}, Lorg/tensorflow/Tensor;->create([JLjava/nio/LongBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 339
    return-void
.end method

.method public varargs feed(Ljava/lang/String;[Z[J)V
    .locals 4
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # [Z
    .param p3, "dims"    # [J

    .prologue
    .line 302
    array-length v2, p2

    new-array v0, v2, [B

    .line 304
    .local v0, "b":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 305
    aget-boolean v2, p2, v1

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_1
    aput-byte v2, v0, v1

    .line 304
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 305
    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 308
    :cond_1
    const-class v2, Ljava/lang/Boolean;

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-static {v2, p3, v3}, Lorg/tensorflow/Tensor;->create(Ljava/lang/Class;[JLjava/nio/ByteBuffer;)Lorg/tensorflow/Tensor;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 309
    return-void
.end method

.method public feedString(Ljava/lang/String;[B)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # [B

    .prologue
    .line 367
    invoke-static {p2}, Lorg/tensorflow/Tensors;->create([B)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 368
    return-void
.end method

.method public feedString(Ljava/lang/String;[[B)V
    .locals 1
    .param p1, "inputName"    # Ljava/lang/String;
    .param p2, "src"    # [[B

    .prologue
    .line 376
    invoke-static {p2}, Lorg/tensorflow/Tensors;->create([[B)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->addFeed(Ljava/lang/String;Lorg/tensorflow/Tensor;)V

    .line 377
    return-void
.end method

.method public fetch(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 528
    invoke-direct {p0, p1}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->getTensor(Ljava/lang/String;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/tensorflow/Tensor;->writeTo(Ljava/nio/ByteBuffer;)V

    .line 529
    return-void
.end method

.method public fetch(Ljava/lang/String;Ljava/nio/DoubleBuffer;)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/nio/DoubleBuffer;

    .prologue
    .line 518
    invoke-direct {p0, p1}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->getTensor(Ljava/lang/String;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/tensorflow/Tensor;->writeTo(Ljava/nio/DoubleBuffer;)V

    .line 519
    return-void
.end method

.method public fetch(Ljava/lang/String;Ljava/nio/FloatBuffer;)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/nio/FloatBuffer;

    .prologue
    .line 488
    invoke-direct {p0, p1}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->getTensor(Ljava/lang/String;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/tensorflow/Tensor;->writeTo(Ljava/nio/FloatBuffer;)V

    .line 489
    return-void
.end method

.method public fetch(Ljava/lang/String;Ljava/nio/IntBuffer;)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/nio/IntBuffer;

    .prologue
    .line 498
    invoke-direct {p0, p1}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->getTensor(Ljava/lang/String;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/tensorflow/Tensor;->writeTo(Ljava/nio/IntBuffer;)V

    .line 499
    return-void
.end method

.method public fetch(Ljava/lang/String;Ljava/nio/LongBuffer;)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # Ljava/nio/LongBuffer;

    .prologue
    .line 508
    invoke-direct {p0, p1}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->getTensor(Ljava/lang/String;)Lorg/tensorflow/Tensor;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/tensorflow/Tensor;->writeTo(Ljava/nio/LongBuffer;)V

    .line 509
    return-void
.end method

.method public fetch(Ljava/lang/String;[B)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # [B

    .prologue
    .line 478
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetch(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 479
    return-void
.end method

.method public fetch(Ljava/lang/String;[D)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # [D

    .prologue
    .line 469
    invoke-static {p2}, Ljava/nio/DoubleBuffer;->wrap([D)Ljava/nio/DoubleBuffer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetch(Ljava/lang/String;Ljava/nio/DoubleBuffer;)V

    .line 470
    return-void
.end method

.method public fetch(Ljava/lang/String;[F)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # [F

    .prologue
    .line 442
    invoke-static {p2}, Ljava/nio/FloatBuffer;->wrap([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetch(Ljava/lang/String;Ljava/nio/FloatBuffer;)V

    .line 443
    return-void
.end method

.method public fetch(Ljava/lang/String;[I)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # [I

    .prologue
    .line 451
    invoke-static {p2}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetch(Ljava/lang/String;Ljava/nio/IntBuffer;)V

    .line 452
    return-void
.end method

.method public fetch(Ljava/lang/String;[J)V
    .locals 1
    .param p1, "outputName"    # Ljava/lang/String;
    .param p2, "dst"    # [J

    .prologue
    .line 460
    invoke-static {p2}, Ljava/nio/LongBuffer;->wrap([J)Ljava/nio/LongBuffer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetch(Ljava/lang/String;Ljava/nio/LongBuffer;)V

    .line 461
    return-void
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 287
    :try_start_0
    invoke-virtual {p0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 289
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 291
    return-void

    .line 289
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getStatString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runStats:Lorg/tensorflow/contrib/android/RunStats;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runStats:Lorg/tensorflow/contrib/android/RunStats;

    invoke-virtual {v0}, Lorg/tensorflow/contrib/android/RunStats;->summary()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public graph()Lorg/tensorflow/Graph;
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    return-object v0
.end method

.method public graphOperation(Ljava/lang/String;)Lorg/tensorflow/Operation;
    .locals 4
    .param p1, "operationName"    # Ljava/lang/String;

    .prologue
    .line 255
    iget-object v1, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->g:Lorg/tensorflow/Graph;

    invoke-virtual {v1, p1}, Lorg/tensorflow/Graph;->operation(Ljava/lang/String;)Lorg/tensorflow/Operation;

    move-result-object v0

    .line 256
    .local v0, "operation":Lorg/tensorflow/Operation;
    if-nez v0, :cond_0

    .line 257
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Node \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' does not exist in model \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->modelName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 260
    :cond_0
    return-object v0
.end method

.method public run([Ljava/lang/String;)V
    .locals 1
    .param p1, "outputNames"    # [Ljava/lang/String;

    .prologue
    .line 187
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->run([Ljava/lang/String;Z)V

    .line 188
    return-void
.end method

.method public run([Ljava/lang/String;Z)V
    .locals 1
    .param p1, "outputNames"    # [Ljava/lang/String;
    .param p2, "enableStats"    # Z

    .prologue
    .line 197
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->run([Ljava/lang/String;Z[Ljava/lang/String;)V

    .line 198
    return-void
.end method

.method public run([Ljava/lang/String;Z[Ljava/lang/String;)V
    .locals 12
    .param p1, "outputNames"    # [Ljava/lang/String;
    .param p2, "enableStats"    # Z
    .param p3, "targetNodeNames"    # [Ljava/lang/String;

    .prologue
    .line 310
    invoke-direct {p0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->closeFetches()V

    .line 317
    iget-boolean v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->flag:Z

    if-eqz v7, :cond_1

    .line 318
    new-instance v7, Ljava/util/Random;

    iget-wide v8, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sign:J

    invoke-direct {v7, v8, v9}, Ljava/util/Random;-><init>(J)V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->ran:Ljava/util/Random;

    .line 319
    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sizes:Ljava/util/List;

    iget v8, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->signinput:I

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    new-array v6, v7, [F

    .line 320
    .local v6, "weights":[F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, v6

    if-ge v1, v7, :cond_0

    .line 321
    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->ran:Ljava/util/Random;

    invoke-virtual {v7}, Ljava/util/Random;->nextFloat()F

    move-result v7

    const/high16 v8, 0x40000000    # 2.0f

    mul-float/2addr v7, v8

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v7, v8

    neg-float v7, v7

    aput v7, v6, v1

    .line 320
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 323
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "inputwithdefault_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->signinput:I

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->shapes:Ljava/util/List;

    iget v9, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->signinput:I

    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [J

    invoke-virtual {p0, v8, v6, v7}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feed(Ljava/lang/String;[F[J)V

    .line 324
    const-string/jumbo v7, "TensorFlowInferenceInterface"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "feed "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->signinput:I

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    .end local v1    # "i":I
    .end local v6    # "weights":[F
    :cond_1
    array-length v8, p1

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v8, :cond_2

    aget-object v2, p1, v7

    .line 353
    .local v2, "o":Ljava/lang/String;
    iget-object v9, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchNames:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 354
    invoke-static {v2}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;->parse(Ljava/lang/String;)Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;

    move-result-object v5

    .line 355
    .local v5, "tid":Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;
    iget-object v9, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    iget-object v10, v5, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;->name:Ljava/lang/String;

    iget v11, v5, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;->outputIndex:I

    invoke-virtual {v9, v10, v11}, Lorg/tensorflow/Session$Runner;->fetch(Ljava/lang/String;I)Lorg/tensorflow/Session$Runner;

    .line 352
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 359
    .end local v2    # "o":Ljava/lang/String;
    .end local v5    # "tid":Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface$TensorId;
    :cond_2
    array-length v8, p3

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v8, :cond_3

    aget-object v4, p3, v7

    .line 360
    .local v4, "t":Ljava/lang/String;
    iget-object v9, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    invoke-virtual {v9, v4}, Lorg/tensorflow/Session$Runner;->addTarget(Ljava/lang/String;)Lorg/tensorflow/Session$Runner;

    .line 359
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 365
    .end local v4    # "t":Ljava/lang/String;
    :cond_3
    if-eqz p2, :cond_5

    .line 366
    :try_start_0
    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    invoke-static {}, Lorg/tensorflow/contrib/android/RunStats;->runOptions()[B

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/tensorflow/Session$Runner;->setOptions([B)Lorg/tensorflow/Session$Runner;

    move-result-object v7

    invoke-virtual {v7}, Lorg/tensorflow/Session$Runner;->runAndFetchMetadata()Lorg/tensorflow/Session$Run;

    move-result-object v3

    .line 367
    .local v3, "r":Lorg/tensorflow/Session$Run;
    iget-object v7, v3, Lorg/tensorflow/Session$Run;->outputs:Ljava/util/List;

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchTensors:Ljava/util/List;

    .line 369
    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runStats:Lorg/tensorflow/contrib/android/RunStats;

    if-nez v7, :cond_4

    .line 370
    new-instance v7, Lorg/tensorflow/contrib/android/RunStats;

    invoke-direct {v7}, Lorg/tensorflow/contrib/android/RunStats;-><init>()V

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runStats:Lorg/tensorflow/contrib/android/RunStats;

    .line 372
    :cond_4
    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runStats:Lorg/tensorflow/contrib/android/RunStats;

    iget-object v8, v3, Lorg/tensorflow/Session$Run;->metadata:[B

    invoke-virtual {v7, v8}, Lorg/tensorflow/contrib/android/RunStats;->add([B)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 390
    .end local v3    # "r":Lorg/tensorflow/Session$Run;
    :goto_3
    invoke-direct {p0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->closeFeeds()V

    .line 391
    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sess:Lorg/tensorflow/Session;

    invoke-virtual {v7}, Lorg/tensorflow/Session;->runner()Lorg/tensorflow/Session$Runner;

    move-result-object v7

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    .line 393
    return-void

    .line 374
    :cond_5
    :try_start_1
    iget-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    invoke-virtual {v7}, Lorg/tensorflow/Session$Runner;->run()Ljava/util/List;

    move-result-object v7

    iput-object v7, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchTensors:Ljava/util/List;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 376
    :catch_0
    move-exception v0

    .line 379
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_2
    const-string/jumbo v7, "TensorFlowInferenceInterface"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Failed to run TensorFlow inference with inputs:["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ", "

    iget-object v10, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->feedNames:Ljava/util/List;

    .line 382
    invoke-static {v9, v10}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "], outputs:["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ", "

    iget-object v10, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->fetchNames:Ljava/util/List;

    .line 384
    invoke-static {v9, v10}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 379
    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 386
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 390
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v7

    invoke-direct {p0}, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->closeFeeds()V

    .line 391
    iget-object v8, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->sess:Lorg/tensorflow/Session;

    invoke-virtual {v8}, Lorg/tensorflow/Session;->runner()Lorg/tensorflow/Session$Runner;

    move-result-object v8

    iput-object v8, p0, Lorg/tensorflow/contrib/android/TensorFlowInferenceInterface;->runner:Lorg/tensorflow/Session$Runner;

    .line 392
    throw v7
.end method
