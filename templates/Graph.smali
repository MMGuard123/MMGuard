.class public final Lorg/tensorflow/Graph;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/tensorflow/Graph$a;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/Object;

.field public b:J

.field private c:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    invoke-static {}, Lorg/tensorflow/TensorFlow;->a()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/tensorflow/Graph;->a:Ljava/lang/Object;

    const/4 v0, 0x0

    iput v0, p0, Lorg/tensorflow/Graph;->c:I

    invoke-static {}, Lorg/tensorflow/Graph;->allocate()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/tensorflow/Graph;->b:J

    return-void
.end method

.method static synthetic a(Lorg/tensorflow/Graph;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lorg/tensorflow/Graph;->a:Ljava/lang/Object;

    return-object v0
.end method

.method private static native allocate()J
.end method

.method static synthetic b(Lorg/tensorflow/Graph;)J
    .locals 2

    iget-wide v0, p0, Lorg/tensorflow/Graph;->b:J

    return-wide v0
.end method

.method static synthetic c(Lorg/tensorflow/Graph;)I
    .locals 2

    iget v0, p0, Lorg/tensorflow/Graph;->c:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/tensorflow/Graph;->c:I

    return v0
.end method

.method static synthetic d(Lorg/tensorflow/Graph;)I
    .locals 1

    iget v0, p0, Lorg/tensorflow/Graph;->c:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/tensorflow/Graph;->c:I

    return v0
.end method

.method private static native delete(J)V
.end method

.method public static native importGraphDef(J[BLjava/lang/String;)V
.end method

.method private static native operation(JLjava/lang/String;)J
.end method


# virtual methods
.method final a()Lorg/tensorflow/Graph$a;
    .locals 2

    new-instance v0, Lorg/tensorflow/Graph$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/tensorflow/Graph$a;-><init>(Lorg/tensorflow/Graph;B)V

    return-object v0
.end method

.method public final a(Ljava/lang/String;)Lorg/tensorflow/Operation;
    .locals 6

    iget-object v1, p0, Lorg/tensorflow/Graph;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-wide v2, p0, Lorg/tensorflow/Graph;->b:J

    invoke-static {v2, v3, p1}, Lorg/tensorflow/Graph;->operation(JLjava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    const/4 v0, 0x0

    monitor-exit v1

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/tensorflow/Operation;

    invoke-direct {v0, p0, v2, v3}, Lorg/tensorflow/Operation;-><init>(Lorg/tensorflow/Graph;J)V

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public a([B)V
    .locals 1

    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lorg/tensorflow/Graph;->a([BLjava/lang/String;)V

    return-void
.end method

.method public a([BLjava/lang/String;)V
    .locals 4

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "graphDef and prefix cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v1, p0, Lorg/tensorflow/Graph;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-wide v2, p0, Lorg/tensorflow/Graph;->b:J

    invoke-static {v2, v3, p1, p2}, Lorg/tensorflow/Graph;->importGraphDef(J[BLjava/lang/String;)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final close()V
    .locals 6

    const-wide/16 v4, 0x0

    iget-object v1, p0, Lorg/tensorflow/Graph;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-wide v2, p0, Lorg/tensorflow/Graph;->b:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    monitor-exit v1

    :goto_0
    return-void

    :cond_0
    :goto_1
    iget v0, p0, Lorg/tensorflow/Graph;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lorg/tensorflow/Graph;->a:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_1
    :try_start_3
    iget-wide v2, p0, Lorg/tensorflow/Graph;->b:J

    invoke-static {v2, v3}, Lorg/tensorflow/Graph;->delete(J)V

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/tensorflow/Graph;->b:J

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method
